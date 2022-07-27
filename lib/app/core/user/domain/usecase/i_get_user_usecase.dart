import 'package:dartz/dartz.dart';
import 'package:innova_estetica/app/core/user/domain/repository/i_get_user_repository.dart';

import '../../../shared/exceptions/i_app_exception.dart';
import '../entities/user_entity.dart';

abstract class IGetUserUsecase {
  Future<Either<IAppException, UserEntity>> call(String email);
}

class GetUserUsecaseImpl implements IGetUserUsecase {
  final IGetUserRepository _repository;

  GetUserUsecaseImpl(this._repository);
  @override
  Future<Either<IAppException, UserEntity>> call(String email) async {
    final result = await _repository.call(email);
    return result;
  }
}
