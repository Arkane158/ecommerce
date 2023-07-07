import 'package:ecommerce/dialoge_utils.dart';
import 'package:ecommerce/model/base/base_navigator.dart';
import 'package:ecommerce/model/base/base_view_model.dart';
import 'package:flutter/material.dart';

abstract class BaseState<T extends StatefulWidget, Vm extends BaseViewModel>
    extends State<T> implements BaseNavigator {
  late Vm viewModel;
  Vm initViewmodel();

  @override
  void initState() {
    super.initState();
    viewModel = initViewmodel();
    viewModel.navigator = this;
  }

  @override
  void hideDialog() {
    DialogeUtils.hideDialog(context);
  }

  @override
  void showMessage(String message,
      {String? posActionTitle,
      VoidCallback? posAction,
      VoidCallback? negAction,
      String? negActionTitle}) {
    DialogeUtils.showMessage(context, message);
  }

  @override
  void showProgressDialog(String message, {bool isDismissible = true}) {
    DialogeUtils.showProgressDialog(context, message = message);
  }
}
