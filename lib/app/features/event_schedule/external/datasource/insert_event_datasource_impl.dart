import 'package:innova_estetica/app/features/event_schedule/domain/entities/param_event_entity.dart';

import '../../../../core/services/hasura/hasura_service.dart';
import '../../../../core/shared/exceptions/hasura_exception.dart';
import '../../infra/datasource/i_insert_event_datasource.dart';
import '../docs_hasura/insert_event_mutation.dart';

class InsertEventDatasourceImpl implements IInsertEventDatasource {
  final HasuraService _hasuraService;

  InsertEventDatasourceImpl(this._hasuraService);
  @override
  Future<int> insertEvent(ParamEventEntity params) async {
    try {
      final hasuraResponse = await _hasuraService.mutation(
        docQuery: insertEventMutation,
        variables: {
          'object': {
            'id_beautician': params.idBeautician,
            'id_client': params.idClient,
            'description': params.description,
            'time_final': params.timeFinal,
            'time_initial': params.timeInitial,
          },
        },
      );
      final result = hasuraResponse['data']['insert_schedule_event_one']['id'];
      return result;
    } on HasuraAppException catch (e) {
      throw HasuraAppException(message: 'falha no hasura $e');
    } catch (e) {
      throw Exception(e);
    }
  }
}
