import 'package:innova_estetica/app/features/registration/domain/entities/measurements_entity.dart';

abstract class IInsertMeasurementsDatasource {
  Future<int> insertMeasurements(MeasurementsEntity params);
}
