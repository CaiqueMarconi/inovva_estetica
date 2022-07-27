import 'package:innova_estetica/app/features/clients/external/docs_hasura/get_clients_query.dart';
import 'package:innova_estetica/app/features/clients/external/model/client_model.dart';
import 'package:innova_estetica/app/features/clients/infra/datasource/i_get_clients_datasource.dart';

import '../../../../core/services/hasura/hasura_service.dart';
import '../../../../core/shared/exceptions/hasura_exception.dart';

class GetClientsDatasourceImpl implements IGetClientsDatasource {
  final HasuraService _hasuraService;

  GetClientsDatasourceImpl(this._hasuraService);
  @override
  Future<List<ClientModel>> getClients() async {
    try {
      final hasuraResponse = await _hasuraService.query(docQuery: getClientsQuery);
      final response = hasuraResponse['data']['clients'] as List;
      final result = response.map((e) => ClientModel.fromMap(e)).toList();
      return result;
    } on HasuraAppException catch (e) {
      throw HasuraAppException(message: 'falha no datasource $e');
    } catch (e) {
      throw Exception(e);
    }
  }
}
