import 'package:bloc/bloc.dart';
import 'package:chat/core/constants/enums/modal_state_enum.dart';
import 'package:chat/core/constants/enums/request_enum.dart';
import 'package:chat/core/failures/failures.dart';
import 'package:chat/features/auth/data/models/user_model.dart';
import 'package:chat/features/auth/domain/auth_repository.dart';
import 'package:chat/features/settings/domain/settings_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final SettingsRepository _repo;
  final AuthRepository _authRepo;
  final UserApiModel user;

  SettingsCubit({
    required SettingsRepository repo,
    required AuthRepository authRepo,
    required this.user,
  })  : _repo = repo,
        _authRepo = authRepo,
        super(
          SettingsState(
            requestState: RequestState.initial,
            user: user,
            modalState: ModalState.none,
            failure: UnknownFailure(),
          ),
        );

  Future<void> uploadImage({required XFile file}) async {
    emit(state.copyWith(requestState: RequestState.loading));
    final result = await _repo.uploadProfileImage(
      userId: user.uid,
      imageFile: file,
    );
    result.fold((l) {
      emit(
        state.copyWith(
          requestState: RequestState.error,
          failure: l,
        ),
      );
    }, (r) async {
      final updatedUser = await _authRepo.getUserDetail();
      emit(
        state.copyWith(
          requestState: RequestState.loaded,
          user: updatedUser,
        ),
      );
    });
  }

  Future<void> updateUsername({required String username}) async {
    emit(
      state.copyWith(
        modalState: ModalState.loading,
      ),
    );
    final result = await _repo.updateUsername(
      userId: user.uid,
      username: username,
    );
    result.fold((l) {
      emit(
        state.copyWith(
          modalState: ModalState.error,
          failure: l,
          user: state.user.copyWith(
            username: username,
          ),
        ),
      );
    }, (r) async {
      final updatedUser = await _authRepo.getUserDetail();
      emit(
        state.copyWith(
          modalState: ModalState.success,
          user: updatedUser,
        ),
      );
    });
  }
}
