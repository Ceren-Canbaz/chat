import 'package:bloc/bloc.dart';
import 'auth_state.dart';

// AuthCubit, durumları yönetir
class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());
}
