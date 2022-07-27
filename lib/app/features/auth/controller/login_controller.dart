import 'package:flutter/cupertino.dart';
import 'package:innova_estetica/app/core/services/firebase/i_firebase_service.dart';

class LoginController {
  final IFirebaseService firebaseService;

  LoginController(this.firebaseService);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> signIn(String email, String password) async {
    await firebaseService.signIn(email, password);
  }

  Future<void> signOut() async {
    await firebaseService.signOut();
  }
}
