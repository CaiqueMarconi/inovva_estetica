import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:innova_estetica/app/core/exceptions/firebase_app_exception.dart';
import 'package:innova_estetica/app/core/services/firebase/i_firebase_service.dart';

class FirebaseService implements IFirebaseService {
  final FirebaseAuth _auth;

  FirebaseService(this._auth);
  @override
  Future<void> signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      if (kDebugMode) {
        print('logado!');
      }
      Modular.to.navigate('/home');
    } on FirebaseAuthException catch (e, trace) {
      switch (e.code) {
        case 'auth/invalid-email':
          throw FirebaseAppException(message: 'Endereço de e-mail inválido', stackTrace: trace);
        case 'auth/invalid-password':
          throw FirebaseAppException(message: 'Senha incorreta', stackTrace: trace);
        case 'auth/internal-error':
          throw FirebaseAppException(message: 'Não é possível se conectar no momento', stackTrace: trace);
        default:
          throw FirebaseAppException(message: e.code, stackTrace: trace);
      }
    }
  }

  @override
  Future<void> signOut() async {
    await _auth.signOut();
    if (kDebugMode) {
      print('deslogado!');
    }
    Modular.to.navigate('/');
  }
}
