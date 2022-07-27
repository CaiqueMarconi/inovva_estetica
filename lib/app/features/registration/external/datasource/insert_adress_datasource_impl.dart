import 'package:innova_estetica/app/core/services/hasura/hasura_service.dart';
import 'package:innova_estetica/app/core/shared/exceptions/hasura_exception.dart';
import 'package:innova_estetica/app/features/registration/domain/entities/adress_entity.dart';
import 'package:innova_estetica/app/features/registration/external/docs_hasura/insert_adress_mutation.dart';
import 'package:innova_estetica/app/features/registration/infra/datasource/i_insert_adress_datasource.dart';

class InsertAdressDatasourceImpl implements IInsertAdressDatasource {
  final HasuraService _hasuraService;

  InsertAdressDatasourceImpl(this._hasuraService);
  @override
  Future<int> insertAdress(AdressEntity params) async {
    try {
      final hasuraResponse = await _hasuraService.mutation(
        docQuery: insertAdressMutation,
        variables: {
          'object': {
            'cep': params.cep,
            'road': params.road,
            'id_client': params.idClient,
            'number': params.number,
            'district': params.district,
          },
        },
      );
      final result = hasuraResponse['data']['insert_adress_one']['id'];
      return result;
    } on HasuraAppException catch (e) {
      throw HasuraAppException(message: 'falha no hasura $e');
    } catch (e) {
      throw Exception(e);
    }
  }
}
