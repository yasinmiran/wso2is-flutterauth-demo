part of 'auth_cubit.dart';

class AuthState extends Equatable {
  final AuthStatus authStatus;
  final UserModel user;

  const AuthState._({this.authStatus = AuthStatus.unknown, this.user});

  const AuthState.unknown() : this._();

  const AuthState.inProgress() : this._(authStatus: AuthStatus.inProgress);

  const AuthState.authenticated(UserModel userModel) : this._(authStatus: AuthStatus.authenticated, user: userModel);

  const AuthState.unauthenticated() : this._(authStatus: AuthStatus.unauthenticated);

  bool isLoading() {
    return authStatus == AuthStatus.inProgress;
  }

  bool isUnAuthenticated() {
    return authStatus == AuthStatus.unknown ||
        authStatus == AuthStatus.unauthenticated;
  }

  @override
  List<Object> get props => [authStatus, user];
}

enum AuthStatus {
  unknown,
  authenticated,
  unauthenticated,
  inProgress,
}
