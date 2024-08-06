import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UserTile extends StatelessWidget {
  const UserTile(
      {super.key,
      required this.username,
      required this.onTap,
      required this.imageFolder,
      this.height,
      this.width});
  final String username;
  final String imageFolder;
  final VoidCallback onTap;
  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(
                16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height ?? 64,
                    width: width ?? 64,
                    child: ClipOval(
                      child: FadeInImage.assetNetwork(
                        placeholder: "",
                        placeholderErrorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Theme.of(context)
                                .colorScheme
                                .surface
                                .withOpacity(
                                  0.4,
                                ),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Icon(
                                  Icons.person_outline,
                                  color: Theme.of(context).colorScheme.primary,
                                  size: 52,
                                ),
                              ],
                            ),
                          );
                        },
                        imageErrorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Theme.of(context)
                                .colorScheme
                                .surface
                                .withOpacity(
                                  0.4,
                                ),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Icon(
                                  Icons.person_outline,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  size: 52,
                                ),
                              ],
                            ),
                          );
                        },
                        image: imageFolder,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Text(username),
                ],
              ),
            ),
          ),
        ),
        const Divider(
          thickness: 0.2,
        )
      ],
    );
  }
}
