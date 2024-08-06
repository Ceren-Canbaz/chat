import 'package:chat/features/settings/domain/settings_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:chat/core/themes/dark_theme.dart';
import 'package:chat/core/themes/light_theme.dart';

class ThemeCubit extends Cubit<ThemeData> {
  final SettingsRepository _repo;
  ThemeCubit({required SettingsRepository repo})
      : _repo = repo,
        super(lightTheme) {
    getTheme();
  }

  void toggleTheme() async {
    var isDarkTheme = state == darkTheme;

    emit(state == lightTheme ? darkTheme : lightTheme);
    await _repo.saveThemeToLocal(!isDarkTheme);
  }

  void getTheme() async {
    try {
      final isDarkTheme = await _repo.loadThemeFromLocal();
      final theme = isDarkTheme ? darkTheme : lightTheme;
      emit(theme);
    } catch (e) {
      print(e);
    }
  }
}
