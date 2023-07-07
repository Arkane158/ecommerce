import 'dart:ui';

abstract class BaseNavigator{
    void showProgressDialog(String message, {bool isDismissible = true});
  void showMessage(String message,
      {String? posActionTitle,
      VoidCallback? posAction,
      VoidCallback? negAction,
      String? negActionTitle});
  void hideDialog();
}