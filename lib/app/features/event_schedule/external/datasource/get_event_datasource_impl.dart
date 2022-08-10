import 'package:innova_estetica/app/core/services/hasura/hasura_service.dart';
import 'package:innova_estetica/app/core/shared/exceptions/hasura_exception.dart';
import 'package:innova_estetica/app/features/event_schedule/external/docs_hasura/get_event_by_id_query.dart';
import 'package:innova_estetica/app/features/event_schedule/external/model/event_model.dart';
import 'package:innova_estetica/app/features/event_schedule/infra/datasource/i_get_event_datasource.dart';

class GetEventDatasourceImpl implements IGetEventDatasource {
  final HasuraService _hasuraService;

  GetEventDatasourceImpl(this._hasuraService);
  @override
  Future<List<EventModel>> getEvent() async {
    try {
      final hasuraResponse = await _hasuraService.query(docQuery: getEventByIdQuery);
      final response = hasuraResponse['data']['schedule_event'] as List;
      final result = response.map((e) => EventModel.fromMap(e)).toList();
      return result;
    } on HasuraAppException catch (e) {
      throw HasuraAppException(message: 'falha no datasource $e');
    } catch (e) {
      throw Exception(e);
    }
  }
}
