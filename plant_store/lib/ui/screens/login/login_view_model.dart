import 'package:flutter/material.dart';

class LoginViewModel with ChangeNotifier {
  bool value = false;
  void check(bool val) {
    value = val;
    notifyListeners();
  }
}
