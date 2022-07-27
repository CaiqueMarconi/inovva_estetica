import 'package:hasura_connect/hasura_connect.dart';
import 'package:innova_estetica/app/core/shared/exceptions/hasura_exception.dart';

import 'i_hasura_service.dart';

class HasuraService implements IHasuraService {
  final HasuraConnect _hasuraConnect;

  const HasuraService(this._hasuraConnect);

  @override
  Future<dynamic> mutation(
      {required String docQuery, Map<String, dynamic>? variables}) async {
    try {
      final response =
          await _hasuraConnect.mutation(docQuery, variables: variables);
      return response;
    } on HasuraError catch (e, s) {
      throw HasuraAppException(
          message: 'Error in hasura service', stackTrace: s);
    }
  }

  @override
  Future<dynamic> query(
      {required String docQuery, Map<String, dynamic>? variables}) async {
    try {
      final response =
          await _hasuraConnect.query(docQuery, variables: variables);
      return response;
    } on HasuraError catch (e, s) {
      throw HasuraAppException(
          message: 'Error in hasura service', stackTrace: s);
    }
  }
}
