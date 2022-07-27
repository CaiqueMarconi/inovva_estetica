import 'package:innova_estetica/app/core/services/hasura/hasura_service.dart';
import 'package:innova_estetica/app/core/shared/exceptions/hasura_exception.dart';
import 'package:innova_estetica/app/features/create_plan/domain/entities/plan_entity.dart';
import 'package:innova_estetica/app/features/create_plan/external/docs_hasura/insert_plan_mutation.dart';
import 'package:innova_estetica/app/features/create_plan/infra/datasource/i_insert_plan_datasource.dart';

class InsertPlanDatasourceImpl implements IInsertPlanDatasource {
  final HasuraService _hasuraService;

  InsertPlanDatasourceImpl(this._hasuraService);
  @override
  Future<int> insertPlan(PlanEntity params) async {
    try {
      final hasuraResponse = await _hasuraService.mutation(docQuery: insertPlanMutation, variables: {
        'object': {
          "name": params.namePlan,
          "description": params.description,
          "qtd_sections": params.qtdSections,
        }
      });
      final result = hasuraResponse['data']['insert_packages_one']['id'];
      return result;
    } on HasuraAppException catch (e) {
      throw HasuraAppException(message: e.message);
    } catch (e) {
      throw Exception(e);
    }
  }
}
