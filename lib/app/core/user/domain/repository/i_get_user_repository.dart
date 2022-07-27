import 'package:dartz/dartz.dart';
import 'package:innova_estetica/app/core/shared/exceptions/i_app_exception.dart';
import 'package:innova_estetica/app/core/user/domain/entities/user_entity.dart';

abstract class IGetUserRepository {
  Future<Either<IAppException, UserEntity>> call(String email);
}
