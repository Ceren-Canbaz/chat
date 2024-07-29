import 'package:bloc/bloc.dart';
import 'package:chat/features/auth/data/auth_data_source.dart';
import 'package:chat/features/auth/data/models/user_model.dart';
import 'package:chat/features/chat/service/chat_service.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final ChatService _chatService;
  final AuthDataSource _authSrc;
  HomeCubit({required ChatService chatService, required AuthDataSource authSrc})
      : _chatService = chatService,
        _authSrc = authSrc,
        super(
          const HomeState(
            userList: [],
            currentUser: UserApiModel(
              email: "",
              uid: "",
            ),
          ),
        );
  Stream<List<UserApiModel>> getUsersStream() {
    return _chatService.getUsersStream();
  }
}
