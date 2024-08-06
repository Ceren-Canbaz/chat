// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/auth/data/auth_data_source.dart' as _i5;
import '../../features/auth/domain/auth_repository.dart' as _i6;
import '../../features/chat/data/repository/chat_repository_impl.dart' as _i9;
import '../../features/chat/data/source/chat_data_source.dart' as _i3;
import '../../features/chat/data/source/chat_data_source_impl.dart' as _i4;
import '../../features/chat/domain/chat_repository.dart' as _i8;
import '../../features/settings/data/settings_data_source.dart' as _i7;
import '../../features/settings/domain/settings_repository.dart' as _i10;

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
    gh.lazySingleton<_i3.ChatDataSource>(() => _i4.ChatDataSourceImpl());
    gh.lazySingleton<_i5.AuthDataSource>(() => _i5.AuthDataSourceImpl());
    gh.lazySingleton<_i6.AuthRepository>(
        () => _i6.AuthRepositoryImpl(src: gh<_i5.AuthDataSource>()));
    gh.lazySingleton<_i7.SettingsDataSource>(
        () => _i7.SettingsDataSourceImpl());
    gh.lazySingleton<_i8.ChatRepository>(
        () => _i9.ChatRepositoryImpl(src: gh<_i3.ChatDataSource>()));
    gh.lazySingleton<_i10.SettingsRepository>(
        () => _i10.SettingsRepositoryImpl(src: gh<_i7.SettingsDataSource>()));
    return this;
  }
}
