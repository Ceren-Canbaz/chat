import 'package:chat/core/failures/failures.dart';
import 'package:chat/core/handlers/repository_executer.dart';
import 'package:chat/features/settings/data/settings_data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

abstract class SettingsRepository {
  Future<Either<Failure, void>> uploadProfileImage({
    required String userId,
    required XFile imageFile,
  });
}

@LazySingleton(as: SettingsRepository)
class SettingsRepositoryImpl implements SettingsRepository {
  final SettingsDataSource _src;
  final RepositoryExecuter _repositoryExecuter = RepositoryExecuter();
  SettingsRepositoryImpl({required SettingsDataSource src}) : _src = src;
  @override
  Future<Either<Failure, void>> uploadProfileImage(
      {required String userId, required XFile imageFile}) async {
    return await _repositoryExecuter.executeWithError(() async {
      return await _src.uploadProfileImage(
          userId: userId, imageFile: imageFile);
    });
  }
}
