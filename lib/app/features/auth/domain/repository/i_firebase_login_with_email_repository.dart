import 'package:dartz/dartz.dart';
import 'package:innova_estetica/app/core/exceptions/firebase_app_exception.dart';
import 'package:innova_estetica/app/core/shared/exceptions/i_app_exception.dart';

import '../entity/user_credentials_entity.dart';

abstract class IFirebaseLoginWithEmailRepository {
  Future<Either<IAppException, UserCredentialEntity>> call(String email, String password);
}
