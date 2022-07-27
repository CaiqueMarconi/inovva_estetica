import 'package:dartz/dartz.dart';
import 'package:innova_estetica/app/core/shared/exceptions/i_app_exception.dart';
import 'package:innova_estetica/app/features/registration/domain/entities/measurements_entity.dart';

abstract class IInsertMeasurementsRepository {
  Future<Either<IAppException, int>> call(MeasurementsEntity params);
}
