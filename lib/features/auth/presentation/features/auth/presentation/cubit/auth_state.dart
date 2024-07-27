import 'package:equatable/equatable.dart';

// AuthState'in temel sınıfı
abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthInitialState extends AuthState {}

// Login state
class AuthLoginState extends AuthState {
  final String email;
  final String password;

  const AuthLoginState({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];

  AuthLoginState copyWith({
    String? email,
    String? password,
  }) {
    return AuthLoginState(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}

// Register state
class AuthRegisterState extends AuthState {
  final String email;
  final String password;
  final String passwordVerify;

  const AuthRegisterState({
    required this.email,
    required this.password,
    required this.passwordVerify,
  });

  @override
  List<Object?> get props => [email, password, passwordVerify];

  AuthRegisterState copyWith({
    String? email,
    String? password,
    String? passwordVerify,
  }) {
    return AuthRegisterState(
      email: email ?? this.email,
      password: password ?? this.password,
      passwordVerify: passwordVerify ?? this.passwordVerify,
    );
  }
}
