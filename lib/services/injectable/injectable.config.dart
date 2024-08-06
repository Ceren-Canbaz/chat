// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/auth/data/auth_data_source.dart' as _i3;
import '../../features/auth/domain/auth_repository.dart' as _i4;
import '../../features/chat/data/chat_data_source.dart' as _i6;
import '../../features/settings/data/settings_data_source.dart' as _i5;
import '../../features/settings/domain/settings_repository.dart' as _i7;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.AuthDataSource>(() => _i3.AuthDataSourceImpl());
    gh.lazySingleton<_i4.AuthRepository>(
        () => _i4.AuthRepositoryImpl(src: gh<_i3.AuthDataSource>()));
    gh.lazySingleton<_i5.SettingsDataSource>(
        () => _i5.SettingsDataSourceImpl());
    gh.lazySingleton<_i6.ChatService>(() => _i6.ChatServiceImpl());
    gh.lazySingleton<_i7.SettingsRepository>(
        () => _i7.SettingsRepositoryImpl(src: gh<_i5.SettingsDataSource>()));
    return this;
  }
}
