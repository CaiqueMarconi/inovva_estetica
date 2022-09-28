import 'package:dartz/dartz.dart';
import 'package:innova_estetica/app/features/event_schedule/domain/entities/param_event_entity.dart';
import '../../../../core/shared/exceptions/i_app_exception.dart';

abstract class IInsertEventRepository {
  Future<Either<IAppException, int>> call(ParamEventEntity params);
}
