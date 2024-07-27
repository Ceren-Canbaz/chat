import 'package:bloc/bloc.dart';
import 'package:chat/core/constants/enums/auth_enum.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthInitialState(pageState: AuthPageState.login));

  void login(String email, String password) {
    emit(AuthLoginState(
        email: email,
        password: password,
        loginState: LoginState.initial,
        pageState: AuthPageState.login));
  }

  void register(String email, String password, String passwordVerify) {
    if (password != passwordVerify) {
      emit(AuthRegisterState(

              ///change this emitations with state.copywith.
              email: email,
              password: password,
              passwordVerify: passwordVerify,
              registerState: RegisterState.initial,
              pageState: AuthPageState.register)
          .copyWith(
              password: 'Passwords dont match ',
              passwordVerify: 'Passwords dont match',
              registerState: RegisterState.passwordsDontMatch));
    } else {
      emit(AuthRegisterState(
          email: email,
          password: password,
          passwordVerify: passwordVerify,
          registerState: RegisterState.success,
          pageState: AuthPageState.register));
    }
  }
}
