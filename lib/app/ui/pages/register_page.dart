import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/app/data/controllers/register_controller.dart';
import 'package:to_do_list/app/data/services/auth_service.dart';
import 'package:to_do_list/app/ui/theme/design_system.dart';
import 'package:to_do_list/app/ui/widgets/custom_button.dart';
import 'package:to_do_list/app/ui/widgets/custom_text_form_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  RegisterController registerController = RegisterController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController passwordConfirmation = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: ToDoColors.backgroundColor,
      body: Container(
        color: ToDoColors.backgroundColor,
        width: size.width,
        height: size.height,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 8.0),
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: ToDoColors.black,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextFormField(
                  controller: email,
                  hintText: 'Email',
                ),
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.01),
                  child: CustomTextFormField(
                    controller: password,
                    hintText: 'Senha',
                    obscureText: true,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.01),
                  child: CustomTextFormField(
                    controller: passwordConfirmation,
                    hintText: 'Confirmar senha',
                    obscureText: true,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.03),
                  child: CustomButton(
                    onPressed: () {
                      final scaffoldMessenger = ScaffoldMessenger.of(context);
                      final navigator = Navigator.of(context);

                      registerController.register(
                        email: email.text,
                        password: password.text,
                        passwordConfirmation: passwordConfirmation.text,
                        auth: context.read<AuthService>(),
                        scaffoldMessenger: scaffoldMessenger,
                        navigator: navigator,
                      );
                    },
                    text: 'Registrar',
                  ),
                ),
              ],
            ),
            Container(),
          ],
        ),
      ),
    );
  }
}
