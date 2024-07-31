import 'package:bloc/bloc.dart';
import 'package:chat/features/auth/domain/auth_repository.dart';
import 'package:chat/features/chat/service/chat_service.dart';
import 'package:equatable/equatable.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final AuthRepository _authRepository;
  final ChatService _chatService;
  final String recieverId;

  ChatCubit(
      {required AuthRepository authRepository,
      required ChatService chatService,
      required this.recieverId})
      : _authRepository = authRepository,
        _chatService = chatService,
        super(
          ChatInitial(),
        );
  Future<void> sendMessage({required String message}) async {
    try {
      await _chatService.sendMessage(recieverId: recieverId, message: message);
    } catch (e) {}
  }
}
