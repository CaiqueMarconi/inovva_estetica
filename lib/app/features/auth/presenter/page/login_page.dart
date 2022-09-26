import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:innova_estetica/app/core/utils/const/strings.image.dart';
import 'package:innova_estetica/app/core/utils/const/strings_colors.dart';
import 'package:innova_estetica/app/core/widgets/text_form_field_custom.dart';

import '../store/login_store.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final loginStore = Modular.get<LoginStore>();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: StringColors.primaryColor,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              StringsImage.imageInovva,
              height: width * 0.2,
            ),
            SizedBox(
              width: width * 0.5,
              child: Column(
                children: [
                  TextFormFieldCustom(
                    labelText: 'Digite o Email *',
                    controller: loginStore.emailController,
                  ),
                  SizedBox(height: width * 0.020),
                  TextFormFieldCustom(
                    obscure: true,
                    labelText: 'Digite a Senha *',
                    controller: loginStore.passwordController,
                  ),
                  SizedBox(height: width * 0.015),
                  ElevatedButton(
                    onPressed: () async {
                      await loginStore.signIn(
                        loginStore.emailController.text,
                        loginStore.passwordController.text,
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(StringColors.pinkClear),
                      padding: MaterialStateProperty.all(
                        EdgeInsets.all(width * 0.006),
                      ),
                      textStyle: MaterialStateProperty.all(
                        TextStyle(fontSize: width * 0.014),
                      ),
                    ),
                    child: const Text(
                      'Entrar',
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
