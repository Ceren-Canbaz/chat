import 'package:chat/core/widgets/drawer_item.dart';
import 'package:chat/features/auth/domain/auth_repository.dart';
import 'package:chat/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:chat/features/auth/presentation/cubit/auth_state.dart';
import 'package:chat/features/settings/settings_page.dart';
import 'package:chat/services/injectable/injectable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svg_flutter/svg.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
    required this.onTapHome,
    required this.onTapSettings,
  });
  final VoidCallback onTapHome;
  final VoidCallback onTapSettings;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Center(
              child: SvgPicture.asset(
                "assets/svgs/chat.svg",
                color: Theme.of(context).colorScheme.primary,
                alignment: Alignment.center,
              ),
            ),
            DrawerItem(
              title: "HOME",
              icon: Icons.home,
              onTap: () {
                onTapHome();
              },
            ),
            DrawerItem(
              title: "SETTINGS",
              icon: Icons.settings,
              onTap: () {
                onTapSettings();

                ///TODO:Fix route system with autoroute or gorouter.
              },
            ),
            BlocProvider(
              create: (context) =>
                  AuthCubit(authRepository: locator<AuthRepository>()),
              child: BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  return DrawerItem(
                    title: "LOGOUT",
                    icon: Icons.logout,
                    onTap: () async {
                      await context.read<AuthCubit>().logOut();
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
