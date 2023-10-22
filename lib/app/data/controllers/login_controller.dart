import 'package:flutter/material.dart';
import 'package:to_do_list/app/data/services/auth_service.dart';

class LoginController {
  var isLoading$ = ValueNotifier(false);

  bool get isLoading => isLoading$.value;

  Future<void> login({
    required String email,
    required String password,
    required AuthService auth,
    required ScaffoldMessengerState scaffoldMessenger,
    required NavigatorState navigator,
  }) async {
    isLoading$.value = true;
    if (email.isNotEmpty && password.isNotEmpty) {
      try {
        await auth.login(email, password);

        if (auth.user != null) {
          navigator.pushNamedAndRemoveUntil('/home', (route) => false);
        }
      } on AuthException catch (e) {
        scaffoldMessenger.showSnackBar(
          SnackBar(
            content: Text(e.message),
          ),
        );
      }
    } else {
      scaffoldMessenger.showSnackBar(
        const SnackBar(
          content: Text('Verifique os dados!'),
        ),
      );
    }
    isLoading$.value = false;
  }
}
