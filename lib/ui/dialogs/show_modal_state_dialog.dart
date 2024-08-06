import 'package:chat/core/constants/enums/modal_state_enum.dart';
import 'package:chat/core/failures/failures.dart';
import 'package:chat/ui/dialogs/error_dialog.dart';
import 'package:chat/ui/dialogs/loading_dialog.dart';
import 'package:chat/ui/dialogs/success_dialog.dart';
import 'package:flutter/material.dart';

void showModalStateDialog(
  BuildContext context,
  ModalState modalState,
  Failure? failure,
  String? successMessage,
) {
  switch (modalState) {
    case ModalState.none:
      // Do nothing if the state is none
      return;
    case ModalState.loading:
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return const LoadingDialog();
        },
      );
      break;
    case ModalState.success:
      showDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return SuccessDialog(
            title: successMessage != "" && successMessage != null
                ? successMessage
                : null,
          );
        },
      );
      break;
    case ModalState.error:
      Navigator.pop(context);
      showDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return ErrorDialog(
            title: failure?.title ?? 'Error',
            message: failure?.message ?? 'An unexpected error occurred',
          );
        },
      );
      break;
  }
}
