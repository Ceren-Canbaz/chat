import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:chat/core/themes/dark_theme.dart';
import 'package:chat/core/themes/light_theme.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(lightTheme); // Başlangıç teması

  void toggleTheme() {
    emit(state == lightTheme ? darkTheme : lightTheme);
  }
}
