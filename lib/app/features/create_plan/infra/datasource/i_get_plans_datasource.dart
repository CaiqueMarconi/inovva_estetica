import 'package:innova_estetica/app/features/create_plan/domain/entities/plan_entity.dart';

abstract class IGetPlansDatasource {
  Future<List<PlanEntity>> getPlans();
}
