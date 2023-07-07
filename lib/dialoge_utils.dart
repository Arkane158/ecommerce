import 'package:flutter/material.dart';

class DialogeUtils {
  static void showProgressDialog(BuildContext context, String message,
      {bool isDismissible = true}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Row(
            children: [
              const CircularProgressIndicator(),
              const SizedBox(
                width: 12,
              ),
              Text(
                message,
                style: const TextStyle(color: Colors.black),
              ),
            ],
          ),
        );
      },
      barrierDismissible: isDismissible,
    );
  }

  static void showMessage(BuildContext context, String message,
      {String? posActionTitle,
      VoidCallback? posAction,
      VoidCallback? negAction,
      String? negActionTitle}) {
    List<Widget> actions = [];
    if (posActionTitle != null) {
      actions.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            if (posAction != null) {
              posAction();
            }
          },
          child: Text(posActionTitle,
              style: const TextStyle(color: Colors.black))));
    }
    if (negActionTitle != null) {
      actions.add(TextButton(
          onPressed: () {
            if (negAction != null) {
              negAction();
            }
          },
          child: Text(negActionTitle,
              style: const TextStyle(color: Colors.black))));
    }

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(message, style: const TextStyle(color: Colors.black)),
            actions: actions,
          );
        });
  }

  static void hideDialog(BuildContext context) {
    Navigator.of(context).pop();
  }
}
