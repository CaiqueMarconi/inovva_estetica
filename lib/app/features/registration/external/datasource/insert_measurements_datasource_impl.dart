import 'package:innova_estetica/app/features/registration/domain/entities/measurements_entity.dart';
import 'package:innova_estetica/app/features/registration/external/docs_hasura/insert_measurements_mutation.dart';

import '../../../../core/services/hasura/hasura_service.dart';
import '../../../../core/shared/exceptions/hasura_exception.dart';
import '../../infra/datasource/i_insert_measurements_datasource.dart';

class InsertMeasurementsDatasourceImpl implements IInsertMeasurementsDatasource {
  final HasuraService _hasuraService;

  InsertMeasurementsDatasourceImpl(this._hasuraService);
  @override
  Future<int> insertMeasurements(MeasurementsEntity params) async {
    try {
      final hasuraResponse = await _hasuraService.mutation(
        docQuery: insertMeasurementsMutation,
        variables: {
          'object': {
            'weight_initial': params.weightInitial,
            'waist_initial': params.waistInitial,
            'id_client': params.idClient,
            'hip_initial': params.hipInitial,
            'abdoment_initial': params.abdomenInitial,
            'height': params.height,
          },
        },
      );
      final result = hasuraResponse['data']['insert_measurements_one']['id'];
      return result;
    } on HasuraAppException catch (e) {
      throw HasuraAppException(message: 'falha no hasura $e');
    } catch (e) {
      throw Exception(e);
    }
  }
}
