import 'package:bloc/bloc.dart';
import 'package:chat/core/constants/enums/auth_enum.dart';
import 'package:chat/core/constants/enums/request_enum.dart';
import 'package:chat/features/auth/domain/auth_repository.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;
  AuthCubit({
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(
          const AuthState(
            pageState: AuthPageState.login,
            message: "",
            requestState: RequestState.initial,
          ),
        );

  Future<void> login(String email, String password) async {
    if (email.trim() == "" || password.trim() == "") {
      emit(
        state.copyWith(
          message: "All fields must be filled out",
        ),
      );
    } else {
      emit(
        state.copyWith(
          requestState: RequestState.loading,
        ),
      );
      final result =
          await _authRepository.signIn(email: email, password: password);
      result.fold(
        (l) => emit(
          state.copyWith(
            requestState: RequestState.error,
            message: l.message,
          ),
        ),
        (r) => emit(
          state.copyWith(
            requestState: RequestState.loaded,
          ),
        ),
      );
    }
  }

  Future<void> register(
      String email, String password, String passwordVerify) async {
    if (email.trim() != "") {
      if (password != passwordVerify) {
        emit(state.copyWith(
          message: "Passwords don't match",
        ));
      } else {
        emit(
          state.copyWith(
            requestState: RequestState.loading,
          ),
        );
        final result =
            await _authRepository.signUp(email: email, password: password);
        result.fold(
          (l) => emit(
            state.copyWith(
              requestState: RequestState.error,
              message: l.message,
            ),
          ),
          (r) => emit(
            state.copyWith(
              requestState: RequestState.loaded,
            ),
          ),
        );
      }
    } else {
      emit(
        state.copyWith(
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

  Future<void> logOut() async {
    final result = await _authRepository.logOut();
    result.fold(
        (l) => emit(
              state.copyWith(
                  requestState: RequestState.error, message: l.message),
            ),
        (r) => emit(
              state.copyWith(
                requestState: RequestState.loaded,
              ),
            ));
  }
}
