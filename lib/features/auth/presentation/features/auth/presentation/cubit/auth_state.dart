part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthLoginState extends AuthState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class AuthRegisterState extends AuthState {
  @override
  List<Object?> get props => throw UnimplementedError();
}
