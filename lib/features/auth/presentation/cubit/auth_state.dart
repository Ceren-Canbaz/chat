import 'package:chat/core/constants/enums/auth_enum.dart';
import 'package:equatable/equatable.dart';

// AuthState'in temel sınıfı
abstract class AuthState extends Equatable {
  final AuthPageState pageState;
  final String message;
  const AuthState({
    required this.pageState,
    required this.message,
  });
  AuthState copyWith({
    AuthPageState? pageState,
    String? message,
  });
}

class AuthInitialState extends AuthState {
  const AuthInitialState({required super.pageState, required super.message});

  @override
  List<Object?> get props => [
        super.pageState,
        super.message,
      ];

  @override
  AuthState copyWith({
    AuthPageState? pageState,
    String? message,
  }) {
    return AuthInitialState(
      pageState: pageState ?? this.pageState,
      message: message ?? this.message,
    );
  }
}

// Login state
class AuthLoginState extends AuthState {
  final String email;
  final String password;
  final LoginState loginState;

  const AuthLoginState({
    required this.email,
    required this.password,
    required this.loginState,
    required super.pageState,
    required super.message,
  });

  @override
  List<Object?> get props => [
        email,
        password,
        loginState,
        super.pageState,
        super.message,
      ];
  @override
  AuthLoginState copyWith(
      {String? email,
      String? password,
      LoginState? loginState,
      AuthPageState? pageState,
      String? message}) {
    return AuthLoginState(
        email: email ?? this.email,
        password: password ?? this.password,
        loginState: loginState ?? this.loginState,
        pageState: pageState ?? this.pageState,
        message: message ?? this.message);
  }
}

// Register state
class AuthRegisterState extends AuthState {
  final String email;
  final String password;
  final String passwordVerify;
  final RegisterState registerState;

  const AuthRegisterState(
      {required this.email,
      required this.password,
      required this.passwordVerify,
      required this.registerState,
      required super.pageState,
      required super.message});

  @override
  List<Object?> get props => [
        email,
        password,
        passwordVerify,
        registerState,
        super.pageState,
        super.message
      ];
  @override
  AuthRegisterState copyWith({
    String? email,
    String? password,
    String? passwordVerify,
    RegisterState? registerState,
    AuthPageState? pageState,
    String? message,
  }) {
    return AuthRegisterState(
      email: email ?? this.email,
      password: password ?? this.password,
      passwordVerify: passwordVerify ?? this.passwordVerify,
      registerState: registerState ?? this.registerState,
      pageState: pageState ?? this.pageState,
      message: message ?? this.message,
    );
  }
}
