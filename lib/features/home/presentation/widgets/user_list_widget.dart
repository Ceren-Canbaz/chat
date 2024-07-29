import 'package:chat/features/home/presentation/cubit/home_cubit.dart';
import 'package:chat/features/home/presentation/widgets/user_item_widget.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

Widget buildUserList({required HomeCubit cubit}) {
  return BlocProvider.value(
    value: cubit,
    child: BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return StreamBuilder(
          stream: cubit.getUsersStream(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return const Center(child: Text("Something Went Wrong"));
            }
            return ListView(
              children: snapshot.data!
                  .map(
                    (e) => buildUserListItem(
                      user: e,
                      cubit: cubit,
                    ),
                  )
                  .toList(),
            );
          },
        );
      },
    ),
  );
}
