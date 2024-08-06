import 'package:chat/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class InformationTextField extends StatefulWidget {
  final String title;
  final String subTitle;
  final Function(String username)? onUsernameChanged;
  final bool allowEdit;

  const InformationTextField({
    super.key,
    required this.title,
    required this.subTitle,
    required this.allowEdit,
    this.onUsernameChanged,
  });

  @override
  State<InformationTextField> createState() => _InformationTextFieldState();
}

class _InformationTextFieldState extends State<InformationTextField> {
  final TextEditingController controller = TextEditingController();

  bool isEditMode = false;
  @override
  void initState() {
    controller.text = widget.subTitle;
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              widget.title,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
            ),
            if (widget.allowEdit)
              IconButton(
                onPressed: () {
                  isEditMode = !isEditMode;
                  setState(() {});
                },
                icon: Icon(
                  Icons.edit,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
          ],
        ),
        if (!isEditMode)
          Text(
            widget.subTitle,
          ),
        if (isEditMode)
          Row(
            children: [
              Expanded(
                flex: 3,
                child: TextField(
                  controller: controller,
                ),
              ),
              IconButton(
                onPressed: widget.onUsernameChanged != null
                    ? () async {
                        await widget.onUsernameChanged!(controller.text);

                        isEditMode = false;
                        setState(() {});
                      }
                    : null,
                color: Theme.of(context).colorScheme.secondary,
                icon: Icon(
                  Icons.done,
                  size: 24,
                  color: Theme.of(context).colorScheme.primary,
                ),
              )
            ],
          )
      ],
    );
  }
}
