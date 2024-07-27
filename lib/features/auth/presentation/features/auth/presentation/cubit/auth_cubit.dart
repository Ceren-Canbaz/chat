import 'package:bloc/bloc.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());

  void login(String email, String password) {
    emit(AuthLoginState(email: email, password: password));
  }

  void register(String email, String password, String passwordVerify) {
    if (password != passwordVerify) {
      emit(AuthRegisterState(
        email: email,
        password: password,
        passwordVerify: passwordVerify,
      ).copyWith(
        password: 'Passwords dont match ',
        passwordVerify: 'Passwords dont match',
      ));
    } else {
      // Parolalar eşitse durumu güncelle
      emit(AuthRegisterState(
        email: email,
        password: password,
        passwordVerify: passwordVerify,
      ));
    }
  }
}