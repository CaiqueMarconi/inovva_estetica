import 'package:flutter/cupertino.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:innova_estetica/app/core/services/firebase/i_firebase_service.dart';
import 'package:innova_estetica/app/core/user/store/user_store.dart';
import 'package:innova_estetica/app/features/auth/store/login_state.dart';

class LoginStore extends StreamStore<Exception, LoginState> {
  final IFirebaseService firebaseService;
  final UserStore userStore;

  LoginStore(
    this.firebaseService,
    this.userStore,
  ) : super(LoginState.init());

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> signIn(String email, String password) async {
    await firebaseService.signIn(email, password);
    final user = await userStore.getUser(email);
    update(state.copyWith(user: user));
  }

  Future<void> signOut() async {
    await firebaseService.signOut();
  }
}
