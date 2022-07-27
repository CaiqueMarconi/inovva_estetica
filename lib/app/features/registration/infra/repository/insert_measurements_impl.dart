import 'package:dartz/dartz.dart';
import 'package:innova_estetica/app/core/shared/exceptions/app_exception.dart';
import 'package:innova_estetica/app/core/shared/exceptions/i_app_exception.dart';
import 'package:innova_estetica/app/features/registration/domain/entities/measurements_entity.dart';

import '../../domain/repository/i_insert_measurements_repository.dart';
import '../datasource/i_insert_measurements_datasource.dart';

class InsertMeasurementsRepositoryImpl implements IInsertMeasurementsRepository {
  final IInsertMeasurementsDatasource _datasource;

  InsertMeasurementsRepositoryImpl(this._datasource);
  @override
  Future<Either<IAppException, int>> call(MeasurementsEntity params) async {
    try {
      final result = await _datasource.insertMeasurements(params);
      return Right(result);
    } catch (e, s) {
      return Left(
        AppException(
          message: e.toString(),
          stackTrace: s,
        ),
      );
    }
  }
}
