import 'package:innova_estetica/app/features/create_plan/domain/entities/plan_entity.dart';
import 'package:innova_estetica/app/features/create_plan/external/docs_hasura/get_plans_query.dart';
import 'package:innova_estetica/app/features/create_plan/external/model/plan_model.dart';

import '../../../../core/services/hasura/hasura_service.dart';
import '../../../../core/shared/exceptions/hasura_exception.dart';
import '../../infra/datasource/i_get_plans_datasource.dart';

class GetPlansDatasourceImpl implements IGetPlansDatasource {
  final HasuraService _hasuraService;

  GetPlansDatasourceImpl(this._hasuraService);
  @override
  Future<List<PlanEntity>> getPlans() async {
    try {
      final hasuraResponse = await _hasuraService.query(docQuery: getPlansQuery);
      final response = hasuraResponse['data']['packages'] as List;
      final result = response.map((e) => PlanModel.fromMap(e)).toList();
      return result;
    } on HasuraAppException catch (e) {
      throw HasuraAppException(message: 'falha no datasource $e');
    } catch (e) {
      throw Exception(e);
    }
  }
}
