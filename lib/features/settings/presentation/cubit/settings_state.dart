part of 'settings_cubit.dart';

class SettingsState extends Equatable {
  final UserApiModel user;
  final RequestState requestState;

  const SettingsState({required this.user, required this.requestState});

  @override
  List<Object> get props => [user, requestState];

  SettingsState copyWith({
    UserApiModel? user,
    RequestState? requestState,
  }) {
    return SettingsState(
      user: user ?? this.user,
      requestState: requestState ?? this.requestState,
    );
  }
}
