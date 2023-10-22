import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/app/data/controllers/login_controller.dart';
import 'package:to_do_list/app/data/services/auth_service.dart';
import 'package:to_do_list/app/ui/theme/design_system.dart';
import 'package:to_do_list/app/ui/widgets/custom_button.dart';
import 'package:to_do_list/app/ui/widgets/custom_text_form_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController loginController = LoginController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: size.width * 0.3,
              height: size.width * 0.3,
              child: Image.asset('assets/to_do_icon.png'),
            ),
            Container(
              margin: EdgeInsets.only(top: size.height * 0.03),
              child: CustomTextFormField(
                controller: email,
                hintText: 'Email',
              ),
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
              margin: EdgeInsets.only(top: size.height * 0.03),
              child: CustomButton(
                onPressed: () {
                  final scaffoldMessenger = ScaffoldMessenger.of(context);
                  final navigator = Navigator.of(context);

                  loginController.login(
                    email: email.text,
                    password: password.text,
                    auth: context.read<AuthService>(),
                    scaffoldMessenger: scaffoldMessenger,
                    navigator: navigator,
                  );
                },
                text: 'Entrar',
              ),
            ),
            Container(
              width: size.width * 0.9,
              margin: EdgeInsets.only(top: size.height * 0.03),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Não tem conta?',
                    style: TextStyle(
                      fontSize: 20,
                      color: ToDoColors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: size.width * 0.05),
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).pushNamed('/register'),
                      child: const Text(
                        'Registrar',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
