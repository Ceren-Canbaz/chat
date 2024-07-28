import 'package:chat/core/widgets/drawer_item.dart';
import 'package:chat/features/auth/domain/auth_repository.dart';
import 'package:chat/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:chat/features/auth/presentation/cubit/auth_state.dart';

import 'package:chat/features/settings/settings_page.dart';
import 'package:chat/services/injectable/injectable.dart';
import 'package:chat/ui/drawer/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:svg_flutter/svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(
        onTapHome: () {
          Navigator.pop(context);
        },
        onTapSettings: () {
          Navigator.of(context).pushReplacementNamed(
            "/settings",
          );
        },
      ),
      appBar: AppBar(
        title: const Text(
          "Home",
        ),
      ),
    );
  }
}
