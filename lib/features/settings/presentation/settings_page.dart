import 'package:chat/core/constants/enums/request_enum.dart';
import 'package:chat/core/widgets/custom_appbar.dart';
import 'package:chat/features/auth/data/models/user_model.dart';
import 'package:chat/features/auth/domain/auth_repository.dart';
import 'package:chat/features/settings/domain/settings_repository.dart';
import 'package:chat/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:chat/services/injectable/injectable.dart';
import 'package:chat/ui/app_drawer.dart';
import 'package:chat/ui/information_text.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({super.key, required this.user});
  final ImagePicker _picker = ImagePicker();
  final UserApiModel user;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsCubit(
          user: user,
          authRepo: locator<AuthRepository>(),
          repo: locator<SettingsRepository>()),
      child: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          return Scaffold(
            drawer: AppDrawer(
              onTapHome: () {
                Navigator.of(context).pushReplacementNamed("/home");
              },
              onTapSettings: () {
                Navigator.pop(context);
              },
            ),
            appBar: CustomAppBar.appBar(
              context: context,
              title: "Settings",
            ),
            body: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: InkWell(
                      radius: 70,
                      borderRadius: BorderRadius.circular(70),
                      onTap: state.requestState != RequestState.loading
                          ? () async {
                              await _requestPermissions();
                              await _pickImage(ImageSource.gallery, context);
                            }
                          : null,
                      child: SizedBox(
                        height: 150,
                        width: 150,
                        child: state.requestState == RequestState.loading
                            ? const CircularProgressIndicator()
                            : ClipOval(
                                child: FadeInImage.assetNetwork(
                                  placeholder: "",
                                  placeholderErrorBuilder:
                                      (context, error, stackTrace) {
                                    return Container(
                                      color:
                                          Theme.of(context).colorScheme.surface,
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Icon(
                                            Icons.person_outline,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            size: 120,
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  imageErrorBuilder:
                                      (context, error, stackTrace) {
                                    return Container(
                                      color:
                                          Theme.of(context).colorScheme.surface,
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Icon(
                                            Icons.person_outline,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            size: 120,
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  image: state.user.imageFolder,
                                  fit: BoxFit.cover,
                                ),
                              ),
                      ),
                    ),
                  ),
                  const InformationText(
                      title: "Username", subTitle: "Ceren Canbaz"),
                  const InformationText(
                      title: "Email", subTitle: "ceren_canbaz@hotmail.com"),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> _pickImage(ImageSource source, BuildContext context) async {
    try {
      final pickedFile = await _picker.pickImage(source: source);
      if (pickedFile != null) {
        context.read<SettingsCubit>().uploadImage(file: pickedFile);
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  Future<void> _requestPermissions() async {
    final status = await Permission.photos.request();
    if (status.isGranted) {
      print("Permission granted");
    } else if (status.isDenied) {
      print("Permission denied");
    } else if (status.isPermanentlyDenied) {
      print("Permission permanently denied");
    }
  }
}
