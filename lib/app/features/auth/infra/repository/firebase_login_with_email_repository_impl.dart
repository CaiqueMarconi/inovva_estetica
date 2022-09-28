import 'package:dartz/dartz.dart';
import 'package:innova_estetica/app/core/exceptions/firebase_app_exception.dart';
import 'package:innova_estetica/app/features/auth/domain/entity/user_credentials_entity.dart';
import 'package:innova_estetica/app/features/auth/domain/repository/i_firebase_login_with_email_repository.dart';
import 'package:innova_estetica/app/features/auth/infra/datasource/i_firebase_login_with_email_datasource.dart';

import '../../../../core/shared/exceptions/i_app_exception.dart';

class FirebaseLoginWithEmailRepositoryImpl implements IFirebaseLoginWithEmailRepository {
  final IFirebaseLoginWithEmailDatasource _datasource;

  FirebaseLoginWithEmailRepositoryImpl(this._datasource);

  @override
  Future<Either<IAppException, UserCredentialEntity>> call(String email, String password) async {
    try {
      final result = await _datasource.call(email, password);
      return Right(result);
    } on FirebaseAppException catch (e) {
      return Left(e);
    }
  }
}
