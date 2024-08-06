import 'package:bloc/bloc.dart';
import 'package:chat/core/constants/enums/modal_state_enum.dart';
import 'package:chat/core/constants/enums/request_enum.dart';

import 'package:chat/core/failures/failures.dart';
import 'package:chat/features/auth/domain/auth_repository.dart';
import 'package:chat/features/chat/data/models/message.dart';

import 'package:chat/features/chat/domain/chat_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final AuthRepository _authRepository;
  final ChatRepository _chatRepository;
  final String recieverId;

  ChatCubit(
      {required AuthRepository authRepository,
      required ChatRepository chatRepository,
      required this.recieverId})
      : _authRepository = authRepository,
        _chatRepository = chatRepository,
        super(ChatState(
          requestState: RequestState.initial,
          modalState: ModalState.none,
          successMessage: "",
          failure: UnknownFailure(),
        ));
  Future<void> sendMessage({required String message}) async {
    final result = await _chatRepository.sendMessage(
        recieverId: recieverId, message: message);
    result.fold(
        (l) => emit(
              state.copyWith(
                failure: l,
                modalState: ModalState.error,
              ),
            ), (r) {
      ///success
    });
  }

  Stream<QuerySnapshot<Message?>> getMessages({
    required String otherUserId,
  }) {
    final String userId = _authRepository.getCurrentUser()?.uid ?? "";

    return _chatRepository.getMessages(
        userId: userId, otherUserId: otherUserId);
  }

  Future<void> editMessage({
    required String messageId,
    required String messageContent,
  }) async {
    final String userId = _authRepository.getCurrentUser()?.uid ?? "";

    final result = await _chatRepository.editMessage(
        otherUserId: recieverId,
        userId: userId,
        messageId: messageId,
        newMessageContent: messageContent);
    result.fold(
        (l) => emit(
              state.copyWith(
                failure: l,
                modalState: ModalState.error,
              ),
            ), (r) async {
      emit(
        state.copyWith(
          modalState: ModalState.success,
          successMessage: "Message Edited Successfully",
        ),
      );
    });
  }

  Future<void> deleteMessage({
    required String messageId,
  }) async {
    final String userId = _authRepository.getCurrentUser()?.uid ?? "";

    final result = await _chatRepository.deleteMessage(
      otherUserId: recieverId,
      userId: userId,
      messageId: messageId,
    );
    result.fold(
        (l) => emit(
              state.copyWith(
                failure: l,
                modalState: ModalState.error,
              ),
            ), (r) async {
      emit(
        state.copyWith(
          modalState: ModalState.success,
          successMessage: "Message Deleted Successfully",
        ),
      );
    });
  }
}
