import 'package:innova_estetica/app/features/event_schedule/domain/entities/param_event_entity.dart';

abstract class IInsertEventDatasource {
  Future<int> insertEvent(ParamEventEntity params);
}
