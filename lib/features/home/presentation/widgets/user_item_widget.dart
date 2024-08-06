import 'package:chat/core/widgets/user_tile.dart';
import 'package:chat/features/auth/data/models/user_model.dart';
import 'package:chat/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget buildUserListItem({
  required UserApiModel user,
  required HomeCubit cubit,
}) {
  return BlocProvider.value(
    value: cubit,
    child: BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (user.email != cubit.state.currentUser.email) {
          return UserTile(
            username: user.email,
            imageFolder: user.imageFolder,
            onTap: () {
              Navigator.pushNamed(
                context,
                "/chat",
                arguments: user,
              );
            },
          );
        } else {
          return Container();
        }
      },
    ),
  );
}
