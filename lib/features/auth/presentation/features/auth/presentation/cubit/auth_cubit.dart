import 'package:bloc/bloc.dart';
import 'package:chat/core/constants/enums/auth_enum.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());

  void login(String email, String password) {
    emit(AuthLoginState(
      email: email,
      password: password,
      loginState: LoginState.initial,
    ));
  }

  void register(String email, String password, String passwordVerify) {
    if (password != passwordVerify) {
      emit(AuthRegisterState(
              email: email,
              password: password,
              passwordVerify: passwordVerify,
              registerState: RegisterState.initial)
          .copyWith(
              password: 'Passwords dont match ',
              passwordVerify: 'Passwords dont match',
              registerState: RegisterState.passwordsDontMatch));
    } else {
      emit(AuthRegisterState(
          email: email,
          password: password,
          passwordVerify: passwordVerify,
          registerState: RegisterState.success));
    }
  }
}
