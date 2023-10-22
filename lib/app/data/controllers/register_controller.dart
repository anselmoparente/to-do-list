import 'package:flutter/material.dart';
import 'package:to_do_list/app/data/services/auth_service.dart';

class RegisterController {
  var isLoading$ = ValueNotifier(false);
  bool get isLoading => isLoading$.value;

  var isLoadImage$ = ValueNotifier(false);
  bool get isLoadImage => isLoadImage$.value;

  Future<void> register({
    required String email,
    required String password,
    required String passwordConfirmation,
    required AuthService auth,
    required ScaffoldMessengerState scaffoldMessenger,
    required NavigatorState navigator,
  }) async {
    isLoading$.value = true;
    if (password.isNotEmpty &&
        passwordConfirmation.isNotEmpty &&
        (password == passwordConfirmation)) {
      try {
        await auth.register(
          email: email,
          password: password,
        );

        navigator.pushNamedAndRemoveUntil('/home', (route) => false);
      } on AuthException catch (e) {
        scaffoldMessenger.showSnackBar(
          SnackBar(
            content: Text(e.message),
          ),
        );
      }
    } else if (password != passwordConfirmation) {
      scaffoldMessenger.showSnackBar(
        const SnackBar(
          content: Text('As senhas não conferem!'),
        ),
      );
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
