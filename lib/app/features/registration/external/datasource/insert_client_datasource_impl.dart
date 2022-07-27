import 'package:innova_estetica/app/core/services/hasura/hasura_service.dart';
import 'package:innova_estetica/app/core/shared/exceptions/hasura_exception.dart';
import 'package:innova_estetica/app/features/registration/domain/entities/client_data_entity.dart';
import 'package:innova_estetica/app/features/registration/external/docs_hasura/insert_client_mutation.dart';
import 'package:innova_estetica/app/features/registration/infra/datasource/i_insert_client_datasource.dart';

class InsertCLientDatasource implements IInsertClientDatasource {
  final HasuraService _hasuraService;

  InsertCLientDatasource(this._hasuraService);
  @override
  Future<int> insertClient(ClientDataEntity params) async {
    try {
      final hasuraResponse = await _hasuraService.mutation(
        docQuery: insertClientMutation,
        variables: {
          'object': {
            'name': params.name,
            'age': params.age,
            'plan': params.plan,
            'procediment': params.procediment,
            'qtd_sections': params.qtdSections,
            'birth_data': params.birthData,
            'cpf': params.cpf,
          },
        },
      );
      final result = hasuraResponse['data']['insert_clients_one']['id'];
      return result;
    } on HasuraAppException catch (e) {
      throw HasuraAppException(message: 'falha no hasura $e');
    } catch (e) {
      throw Exception(e);
    }
  }
}
