import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:innova_estetica/app/core/utils/const/strings.image.dart';
import 'package:innova_estetica/app/core/utils/const/strings_colors.dart';

import 'package:innova_estetica/app/features/auth/store/login_store.dart';

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
                  TextFormField(
                    controller: loginStore.emailController,
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: StringColors.pinkClear),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: StringColors.pinkClear),
                      ),
                      labelText: 'Digite o Email',
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: width * 0.020),
                  TextFormField(
                    obscureText: true,
                    controller: loginStore.passwordController,
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: StringColors.pinkClear),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: StringColors.pinkClear),
                      ),
                      labelText: 'Digite a senha',
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: width * 0.015),
                  ElevatedButton(
                    onPressed: () async {
                      await loginStore.signIn(
                          'caiquedavs@hotmail.com', //loginStore.emailController.text,
                          '123456789' //loginStore.passwordController.text,
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
