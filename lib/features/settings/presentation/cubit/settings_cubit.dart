import 'package:bloc/bloc.dart';
import 'package:chat/features/auth/domain/auth_repository.dart';
import 'package:chat/features/settings/domain/settings_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final SettingsRepository _repo;
  final AuthRepository _authRepo;
  SettingsCubit(
      {required SettingsRepository repo, required AuthRepository authRepo})
      : _repo = repo,
        _authRepo = authRepo,
        super(SettingsState());

  Future<void> uploadImage({required XFile file}) async {
    final result = await _repo.uploadProfileImage(
      userId: _authRepo.getCurrentUser()!.uid,
      imageFile: file,
    );
    result.fold((l) {
      print(l.message);
    }, (r) {});
  }
}
