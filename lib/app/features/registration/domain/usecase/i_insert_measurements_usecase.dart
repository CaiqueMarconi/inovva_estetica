import 'package:dartz/dartz.dart';
import 'package:innova_estetica/app/core/shared/exceptions/i_app_exception.dart';
import 'package:innova_estetica/app/features/registration/domain/entities/measurements_entity.dart';

import '../repository/i_insert_measurements_repository.dart';

abstract class IInsertMeasurementsUsecase {
  Future<Either<IAppException, int>> call(MeasurementsEntity params);
}

class InsertMeasurementsUsecaseImpl implements IInsertMeasurementsUsecase {
  final IInsertMeasurementsRepository _repository;

  InsertMeasurementsUsecaseImpl(this._repository);
  @override
  Future<Either<IAppException, int>> call(MeasurementsEntity params) async {
    final result = await _repository.call(params);
    return result;
  }
}
