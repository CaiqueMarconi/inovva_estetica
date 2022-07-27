import 'package:innova_estetica/app/features/event_schedule/external/model/event_model.dart';

abstract class IGetEventDatasource {
  Future<EventModel> getEvent(int idClient);
}
