import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  void login() {
    _isLoggedIn = true;
    Future.microtask(() {
      notifyListeners();
    });
  }

  void logout() {
    _isLoggedIn = false;
    Future.microtask(() {
      notifyListeners();
    });
  }
}
