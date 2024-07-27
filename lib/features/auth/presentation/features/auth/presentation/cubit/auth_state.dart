import 'package:chat/core/constants/enums/auth_enum.dart';
import 'package:equatable/equatable.dart';

// AuthState'in temel sınıfı
abstract class AuthState extends Equatable {
  final AuthPageState pageState;
  const AuthState({required this.pageState});
  AuthState copyWith({
    AuthPageState? pageState,
  });
}

class AuthInitialState extends AuthState {
  const AuthInitialState({required super.pageState});

  @override
  List<Object?> get props => [
        super.pageState,
      ];

  @override
  AuthState copyWith({AuthPageState? pageState}) {
    return AuthInitialState(
      pageState: pageState ?? this.pageState,
    );
  }
}

// Login state
class AuthLoginState extends AuthState {
  final String email;
  final String password;
  final LoginState loginState;

  const AuthLoginState(
      {required this.email,
      required this.password,
      required this.loginState,
      required super.pageState});

  @override
  List<Object?> get props => [email, password, loginState, super.pageState];
  @override
  AuthLoginState copyWith(
      {String? email,
      String? password,
      LoginState? loginState,
      AuthPageState? pageState}) {
    return AuthLoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      loginState: loginState ?? this.loginState,
      pageState: pageState ?? this.pageState,
    );
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
      required super.pageState});

  @override
  List<Object?> get props =>
      [email, password, passwordVerify, registerState, super.pageState];
  @override
  AuthRegisterState copyWith({
    String? email,
    String? password,
    String? passwordVerify,
    RegisterState? registerState,
    AuthPageState? pageState,
  }) {
    return AuthRegisterState(
        email: email ?? this.email,
        password: password ?? this.password,
        passwordVerify: passwordVerify ?? this.passwordVerify,
        registerState: registerState ?? this.registerState,
        pageState: pageState ?? this.pageState);
  }
}
