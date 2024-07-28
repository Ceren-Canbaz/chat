import 'package:chat/core/widgets/user_tile.dart';
import 'package:chat/features/chat/service/chat_service.dart';
import 'package:chat/services/injectable/injectable.dart';
import 'package:chat/ui/app_drawer.dart';
import 'package:flutter/material.dart';

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
      body: _buildUserList(),
    );
  }
}

Widget _buildUserList() {
  return StreamBuilder(
    stream: locator<ChatService>().getUsersStream(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const CircularProgressIndicator();
      }

      if (snapshot.hasError) {
        return const Text("Something Went Wrong");

        ///TODO:Fix that with error handler
      }
      return ListView(
        children: snapshot.data!
            .map(
              (e) => _buildUserListItem(
                e,
              ),
            )
            .toList(),
      );
    },
  );
}

///TODO: Map item must be changed with entity
Widget _buildUserListItem(Map<String, dynamic> userData) {
  return UserTile(
    username: userData["email"],
    onTap: () {
      //navigate chat page
    },
  );
}
