import 'package:bloc/bloc.dart';
import 'package:chat/features/auth/data/auth_data_source.dart';
import 'package:chat/features/auth/data/models/user_model.dart';
import 'package:chat/features/auth/domain/auth_repository.dart';
import 'package:chat/features/chat/data/source/chat_data_source.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final ChatDataSource _chatService;
  final AuthRepository _authRepository;
  HomeCubit(
      {required ChatDataSource chatService,
      required AuthRepository authRepository})
      : _chatService = chatService,
        _authRepository = authRepository,
        super(
          HomeState(userList: const [], currentUser: UserApiModel.empty()),
        );
  Stream<List<UserApiModel>> getUsersStream() {
    return _chatService.getUsersStream();
  }

  Future<void> getUser() async {
    final user = await _authRepository.getUserDetail();
    emit(
      state.copyWith(
        currentUser: user,
      ),
    );
  }
}
