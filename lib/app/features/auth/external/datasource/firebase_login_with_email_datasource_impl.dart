import 'package:firebase_auth/firebase_auth.dart';
import 'package:innova_estetica/app/core/services/firebase/i_firebase_service.dart';
import 'package:innova_estetica/app/core/shared/exceptions/app_exception.dart';
import 'package:innova_estetica/app/core/shared/exceptions/i_app_exception.dart';
import 'package:innova_estetica/app/features/auth/domain/entity/user_credentials_entity.dart';
import 'package:innova_estetica/app/features/auth/infra/datasource/i_firebase_login_with_email_datasource.dart';

import '../../../../core/exceptions/firebase_app_exception.dart';

class FirebaseLoginWithEmailDatasourceImpl implements IFirebaseLoginWithEmailDatasource {
  final IFirebaseService _firebaseService;

  FirebaseLoginWithEmailDatasourceImpl(this._firebaseService);
  @override
  Future<UserCredentialEntity> call(String email, String password) async {
    try {
      final result = await _firebaseService.signIn(email, password);
      return result;
    } on FirebaseAppException catch (e, s) {
      throw FirebaseAppException(message: e.message, stackTrace: s);
    }
  }
}
