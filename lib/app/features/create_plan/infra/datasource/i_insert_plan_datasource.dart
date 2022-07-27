import '../../domain/entities/plan_entity.dart';

abstract class IInsertPlanDatasource {
  Future<int> insertPlan(PlanEntity params);
}
