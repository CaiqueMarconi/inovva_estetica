import 'package:dartz/dartz.dart';
import 'package:innova_estetica/app/core/shared/exceptions/i_app_exception.dart';
import 'package:innova_estetica/app/features/auth/domain/entity/user_credentials_entity.dart';

import '../repository/i_firebase_login_with_email_repository.dart';

abstract class IFirebaseLoginWithEmailUsecase {
  Future<Either<IAppException, UserCredentialEntity>> call(String email, String password);
}

class FirebaseLoginEmailUsecaseImpl implements IFirebaseLoginWithEmailUsecase {
  final IFirebaseLoginWithEmailRepository _repository;

  FirebaseLoginEmailUsecaseImpl(this._repository);
  @override
  Future<Either<IAppException, UserCredentialEntity>> call(String email, String password) {
    final result = _repository.call(email, password);
    return result;
  }
}
