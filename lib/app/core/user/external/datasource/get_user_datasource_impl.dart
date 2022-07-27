import 'package:innova_estetica/app/core/services/hasura/hasura_service.dart';
import 'package:innova_estetica/app/core/shared/exceptions/hasura_exception.dart';
import 'package:innova_estetica/app/core/user/external/docs_hasura/get_user_query.dart';
import 'package:innova_estetica/app/core/user/external/model/user_model.dart';
import 'package:innova_estetica/app/core/user/infra/datasource/i_get_user_datasource.dart';

class GetUserDatasourceImpl implements IGetUserDatasource {
  final HasuraService _hasuraService;

  GetUserDatasourceImpl(this._hasuraService);
  @override
  Future<UserModel> getUser(String email) async {
    try {
      final hasuraResponse = await _hasuraService.query(docQuery: getUserQuery, variables: {'email': email});
      final response = hasuraResponse['data']['beauticians'][0];
      final result = UserModel.fromMap(response);
      return result;
    } on HasuraAppException catch (e) {
      throw HasuraAppException(message: e.message);
    } catch (e) {
      throw Exception(e);
    }
  }
}
