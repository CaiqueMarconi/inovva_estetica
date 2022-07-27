import 'package:innova_estetica/app/core/shared/exceptions/app_exception.dart';
import 'package:innova_estetica/app/core/user/domain/entities/user_entity.dart';
import 'package:innova_estetica/app/core/shared/exceptions/i_app_exception.dart';
import 'package:dartz/dartz.dart';
import 'package:innova_estetica/app/core/user/domain/repository/i_get_user_repository.dart';
import 'package:innova_estetica/app/core/user/infra/datasource/i_get_user_datasource.dart';

class GetUserRepositoryImpl implements IGetUserRepository {
  final IGetUserDatasource _datasource;

  GetUserRepositoryImpl(this._datasource);

  @override
  Future<Either<IAppException, UserEntity>> call(String email) async {
    try {
      final result = await _datasource.getUser(email);
      return Right(result);
    } catch (e, s) {
      return Left(AppException(message: e.toString(), stackTrace: s));
    }
  }
}
