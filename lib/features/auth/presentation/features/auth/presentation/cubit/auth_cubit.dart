import 'package:bloc/bloc.dart';
import 'package:chat/core/constants/enums/auth_enum.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit()
      : super(
          const AuthInitialState(
            pageState: AuthPageState.login,
            message: "",
          ),
        );

  void login(String email, String password) {
    emit(AuthLoginState(
      email: email,
      password: password,
      loginState: LoginState.initial,
      pageState: AuthPageState.login,
      message: "",
    ));
  }

  Future<void> register(
      String email, String password, String passwordVerify) async {
    if (email.trim() != "") {
      if (password != passwordVerify) {
        emit(AuthRegisterState(
                email: email,
                password: password,
                passwordVerify: passwordVerify,
                registerState: RegisterState.initial,
                pageState: AuthPageState.register,
                message: "")
            .copyWith(
          password: password,
          passwordVerify: passwordVerify,
          registerState: RegisterState.error,
          message: "Passwords don't match",
        ));
      } else {
        emit(
          AuthRegisterState(
              email: email,
              password: password,
              passwordVerify: passwordVerify,
              registerState: RegisterState.success,
              pageState: AuthPageState.register,
              message: ""),
        );
      }
    } else {
      emit(
        AuthRegisterState(
          email: email,
          password: password,
          passwordVerify: passwordVerify,
          pageState: AuthPageState.register,
          registerState: RegisterState.error,
          message: "All fields must be filled out",
        ),
      );
    }
  }

  void changePage({required AuthPageState pageState}) {
    emit(
      state.copyWith(
        pageState: pageState,
      ),
    );
  }
}
