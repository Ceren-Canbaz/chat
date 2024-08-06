part of 'chat_cubit.dart';

class ChatState extends Equatable {
  final RequestState requestState;
  final ModalState modalState;
  final String successMessage;
  final Failure failure;

  const ChatState(
      {required this.requestState,
      required this.modalState,
      required this.successMessage,
      required this.failure});

  @override
  List<Object> get props => [requestState, modalState, successMessage, failure];

  ChatState copyWith({
    RequestState? requestState,
    ModalState? modalState,
    String? successMessage,
    Failure? failure,
  }) {
    return ChatState(
      requestState: requestState ?? this.requestState,
      modalState: modalState ?? ModalState.none,
      successMessage: successMessage ?? this.successMessage,
      failure: failure ?? this.failure,
    );
  }
}
