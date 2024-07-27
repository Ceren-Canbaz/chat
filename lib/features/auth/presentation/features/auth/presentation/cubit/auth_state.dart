import 'package:chat/core/constants/enums/auth_enum.dart';
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
  final LoginState loginState;

  const AuthLoginState({
    required this.email,
    required this.password,
    required this.loginState,
  });

  @override
  List<Object?> get props => [
        email,
        password,
        loginState,
      ];

  AuthLoginState copyWith(
      {String? email, String? password, LoginState? loginState}) {
    return AuthLoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      loginState: loginState ?? this.loginState,
    );
  }
}

// Register state
class AuthRegisterState extends AuthState {
  final String email;
  final String password;
  final String passwordVerify;
  final RegisterState registerState;

  const AuthRegisterState({
    required this.email,
    required this.password,
    required this.passwordVerify,
    required this.registerState,
  });

  @override
  List<Object?> get props => [
        email,
        password,
        passwordVerify,
        registerState,
      ];

  AuthRegisterState copyWith({
    String? email,
    String? password,
    String? passwordVerify,
    RegisterState? registerState,
  }) {
    return AuthRegisterState(
      email: email ?? this.email,
      password: password ?? this.password,
      passwordVerify: passwordVerify ?? this.passwordVerify,
      registerState: registerState ?? this.registerState,
    );
  }
}
