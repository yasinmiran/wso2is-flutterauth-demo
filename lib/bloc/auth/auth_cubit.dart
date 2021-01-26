import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutterauth/data/models/user_model.dart';
import 'package:flutterauth/data/services/auth_service.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthService _authService = AuthService();

  AuthCubit() : super(AuthState.unknown());

  Future<void> login() async {
    emit(AuthState.inProgress());
    UserModel user = await _authService.login();
    if (user != null) {
      emit(AuthState.authenticated(user));
    } else {
      emit(AuthState.unauthenticated());
    }
  }

  Future<void> logout() async {
    emit(AuthState.inProgress());
    await _authService.logout();
    emit(AuthState.unauthenticated());
  }
}
