part of 'settings_cubit.dart';

class SettingsState extends Equatable {
  final UserApiModel user;
  final RequestState requestState;
  final ModalState modalState;
  final Failure failure;
  const SettingsState({
    required this.user,
    required this.requestState,
    required this.modalState,
    required this.failure,
  });

  @override
  List<Object> get props => [user, requestState, modalState, failure];

  SettingsState copyWith({
    UserApiModel? user,
    RequestState? requestState,
    ModalState? modalState,
    Failure? failure,
  }) {
    return SettingsState(
        user: user ?? this.user,
        requestState: requestState ?? this.requestState,
        modalState: modalState ?? ModalState.none,
        failure: failure ?? this.failure);
  }
}
