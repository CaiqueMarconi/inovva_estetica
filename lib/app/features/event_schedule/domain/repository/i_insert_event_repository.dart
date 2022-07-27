import 'package:dartz/dartz.dart';
import 'package:innova_estetica/app/features/event_schedule/domain/entities/param_event_entity.dart';
import 'package:innova_estetica/app/features/event_schedule/domain/error/insert_event_failure.dart';

abstract class IInsertEventRepository {
  Future<Either<IInsertEventFailure, int>> call(ParamEventEntity params);
}
