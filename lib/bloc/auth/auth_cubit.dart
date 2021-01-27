import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutterauth/data/models/user_model.dart';
import 'package:flutterauth/data/services/auth_service.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthService _authService = AuthService();

  AuthCubit() : super(AuthState.unknown());

  /// The login event of the application. Once called
  /// it will emit an in-progress event to notify the
  /// user that the action is in-progress state.
  ///
  /// Once successfully authenticated it will emit and
  /// authenticated state otherwise unauthenticated state.
  Future<void> login() async {
    emit(AuthState.inProgress());
    UserModel user = await _authService.login();
    if (user != null) {
      emit(AuthState.authenticated(user));
    } else {
      emit(AuthState.unauthenticated());
    }
  }

  /// Calls the logout service call and immediately
  /// yields the unauthenticated state.
  Future<void> logout() async {
    emit(AuthState.inProgress());
    await _authService.logout();
    emit(AuthState.unauthenticated());
  }
}
