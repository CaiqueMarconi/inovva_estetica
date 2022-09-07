import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:innova_estetica/app/core/services/firebase/i_firebase_service.dart';
import 'package:innova_estetica/app/core/user/store/user_store.dart';
import 'package:innova_estetica/app/features/auth/domain/usecase/firebase_login_with_email_usecase.dart';
import 'package:innova_estetica/app/features/auth/store/login_state.dart';

class LoginStore extends StreamStore<Exception, LoginState> {
  final IFirebaseService firebaseService;
  final IFirebaseLoginWithEmailUsecase _firebaseLoginWithEmailUsecase;
  final UserStore userStore;

  LoginStore(
    this._firebaseLoginWithEmailUsecase,
    this.userStore,
    this.firebaseService,
  ) : super(LoginState.init());

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> signIn(String email, String password) async {
    final user = await userStore.getUser(email);
    update(state.copyWith(user: user));
    final result = await _firebaseLoginWithEmailUsecase.call(email, password);
    result.fold((l) {
      final message = l.message;

      Asuka.showSnackBar(
        SnackBar(
          content: Text(
            message,
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red[900],
          duration: const Duration(seconds: 3),
        ),
      );
    }, (r) => Modular.to.navigate('/home'));
  }

  Future<void> signOut() async {
    await firebaseService.signOut();
  }
}
