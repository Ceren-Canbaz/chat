import 'package:chat/core/widgets/custom_appbar.dart';

import 'package:chat/features/auth/data/auth_data_source.dart';

import 'package:chat/features/chat/service/chat_service.dart';
import 'package:chat/features/home/presentation/cubit/home_cubit.dart';
import 'package:chat/features/home/presentation/widgets/user_list_widget.dart';
import 'package:chat/services/injectable/injectable.dart';
import 'package:chat/ui/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(
        authSrc: locator<AuthDataSource>(),
        chatService: locator<ChatService>(),
      ),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
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
            appBar: CustomAppBar.appBar(context: context, title: "Home"),
            body: buildUserList(
              cubit: context.read<HomeCubit>(),
            ),
          );
        },
      ),
    );
  }
}
