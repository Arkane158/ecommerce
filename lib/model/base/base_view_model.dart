import 'package:ecommerce/model/base/base_navigator.dart';
import 'package:flutter/material.dart';

class BaseViewModel<N extends BaseNavigator> extends ChangeNotifier {
  N? navigator;
}
