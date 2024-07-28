import 'package:bloc/bloc.dart';
import 'package:chat/core/constants/enums/auth_enum.dart';
import 'package:chat/features/auth/domain/auth_repository.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;
  AuthCubit({
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(
          const AuthInitialState(
            pageState: AuthPageState.login,
            message: "",
          ),
        );

  Future<void> login(String email, String password) async {
    if (email.trim() == "" || password.trim() == "") {
      emit(AuthLoginState(
        email: email,
        password: password,
        loginState: LoginState.error,
        pageState: AuthPageState.login,
        message: "All fields must be filled out", // make constant,
      ));
    } else {
      try {
        final user =
            await _authRepository.signIn(email: email, password: password);

        emit(AuthLoginState(
          email: email,
          password: password,
          loginState: LoginState.success,
          pageState: AuthPageState.logged,
          message: "logged", // make constant
        ));
      } catch (_) {
        emit(AuthLoginState(
          email: email,
          password: password,
          loginState: LoginState.error,
          pageState: AuthPageState.login,
          message: "", // make constant
        ));
      }
    }
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
          message: "",
        ).copyWith(
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
      state.copyWith(pageState: pageState, message: ""),
    );
  }
}
