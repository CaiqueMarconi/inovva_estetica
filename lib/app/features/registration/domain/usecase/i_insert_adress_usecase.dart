import 'package:dartz/dartz.dart';
import 'package:innova_estetica/app/features/registration/domain/entities/adress_entity.dart';
import 'package:innova_estetica/app/features/registration/domain/error/insert_adress_failure.dart';
import 'package:innova_estetica/app/features/registration/domain/repository/i_insert_adress_repository.dart';

abstract class IInsertAdressUsecase {
  Future<Either<IInsertAdressFailure, int>> call(AdressEntity params);
}

class InsertAdressUsecaseImpl implements IInsertAdressUsecase {
  final IInsertAdressRepository _repository;

  InsertAdressUsecaseImpl(this._repository);
  @override
  Future<Either<IInsertAdressFailure, int>> call(AdressEntity params) async {
    final result = await _repository.call(params);
    return result;
  }
}
