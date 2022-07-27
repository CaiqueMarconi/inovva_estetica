import 'package:flutter_modular/flutter_modular.dart';

class RegistrationGuard extends RouteGuard {
  RegistrationGuard() : super(redirectTo: '/home/registration/');

  @override
  Future<bool> canActivate(String path, ModularRoute router) async {
    return await true;
    //Modular.get<AuthStore>().isLogged;
  }
}
