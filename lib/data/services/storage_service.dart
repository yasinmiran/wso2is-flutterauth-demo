import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService {
  static final FlutterSecureStorage secureStorage = FlutterSecureStorage();

  static const String idTokenStorageKey = "com.wso2.flutterauth.idToken";
  static const String accessTokenStorageKey = "com.wso2.flutterauth.accessToken";
  static const String refreshTokenStorageKey = "com.wso2.flutterauth.refreshToken";

  Future<void> write({final String key, final String value}) {
    return secureStorage.write(key: key, value: value);
  }

  Future<String> read({final String key}) {
    return secureStorage.read(key: key);
  }

  Future<void> wipeAll() async {
    await secureStorage.delete(key: idTokenStorageKey);
    await secureStorage.delete(key: accessTokenStorageKey);
    await secureStorage.delete(key: refreshTokenStorageKey);
  }
}
