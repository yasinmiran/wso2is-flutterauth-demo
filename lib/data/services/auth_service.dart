import 'package:dio/dio.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutterauth/data/constants/constants.dart';
import 'package:flutterauth/data/models/user_model.dart';
import 'package:flutterauth/data/services/storage_service.dart';
import 'package:flutterauth/data/util/common.dart';
import 'package:flutterauth/data/util/datetime.dart';
import 'package:flutterauth/data/util/logger.dart';

class AuthService {
  final FlutterAppAuth _flutterAppAuth = FlutterAppAuth();
  final StorageService _secureStorage = StorageService();

  Future<UserModel> login() async {
    var request = AuthorizationTokenRequest(
      appClientID,
      authRedirectURI,
      issuer: issuer,
      discoveryUrl: discoveryEndpoint,
      scopes: const <String>['openid', 'profile', 'offline_access'],
    );
    try {
      // This is a convenient method that automates the authorize() and token() for us. Since we provide
      // the [discoveryEndpoint] `flutter_appauth` sends the token request on behalf of you.
      final AuthorizationTokenResponse result = await _flutterAppAuth.authorizeAndExchangeCode(request);
      logMessage(this, "authorized and exchanged the code for token...");

      // Save the token into flutter secure storage.
      _secureStorage.write(
        key: StorageService.idTokenStorageKey,
        value: result.idToken,
      );
      _secureStorage.write(
        key: StorageService.accessTokenStorageKey,
        value: result.accessToken,
      );
      _secureStorage.write(
        key: StorageService.refreshTokenStorageKey,
        value: result.refreshToken,
      );
      logMessage(this, "saved tokens to secure storage...");

      // Call the `oauth2/userinfo/` endpoint to get the user information.
      logMessage(this, "calling the /userinfo endpoint");
      final Response userInfo = await _getUserInfo();

      // Parse the id_token into a map
      Map<String, dynamic> idToken = parseIdToken(result.idToken);
      // Parse the data to the model
      return UserModel(
        username: (idToken['sub'] as String).split("@")[0],
        userInfo: UserInfo.fromJSON(userInfo.data),
        accessToken: result.accessToken,
        accessTokenType: result.tokenType,
        accessTokenExpiryTime: toReadable(result.accessTokenExpirationDateTime),
        idToken: result.idToken,
        idTokenIssuedTime: toReadable(fromEpoch((idToken['iat'] as num).toInt())),
        idTokenExpiryTime: toReadable(fromEpoch((idToken['exp'] as num).toInt())),
        refreshToken: result.refreshToken,
      );
    } catch (error) {
      logMessage(this, "failed to authenticate user", error);
      return Future.value(null);
    }
  }

  Future<void> logout() async {
    // Below url is the single logout endpoint. However. instead of this we can just simply invalidate the
    // tokens which are stored in the secure storage.
    // https://is.wso2isdemo.com:443/oidc/logout?id_token_hint=id_token&post_logout_redirect_uri=
    await _secureStorage.wipeAll();
  }

  /// Return the `accessToken` from the flutter
  /// secure storage.
  Future<String> session() async {
    return await _secureStorage.read(
      key: StorageService.accessTokenStorageKey,
    );
  }

  Future<Response> _getUserInfo() async {
    String accessToken = await session();
    try {
      final Response response = await Dio().get(
        "$origin/oauth2/userinfo",
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $accessToken",
        }),
        queryParameters: {"schema": "openid"},
      );
      return response;
    } catch (error) {
      logMessage(this, "failed to get user info", error);
      return Future.value(null);
    }
  }
}
