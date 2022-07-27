import 'package:dartz/dartz.dart';
import 'package:innova_estetica/app/features/registration/domain/entities/client_data_entity.dart';
import 'package:innova_estetica/app/features/registration/domain/error/insert_client_failure.dart';
import 'package:innova_estetica/app/features/registration/domain/repository/i_insert_client_repository.dart';

abstract class IInsertClientUsecase {
  Future<Either<IInsertClientFailure, int>> call(ClientDataEntity params);
}

class InsertClientUsecaseImpl implements IInsertClientUsecase {
  final IInsertClientRepository _repository;

  InsertClientUsecaseImpl(this._repository);
  @override
  Future<Either<IInsertClientFailure, int>> call(
      ClientDataEntity params) async {
    final result = await _repository.call(params);
    return result;
  }
}
