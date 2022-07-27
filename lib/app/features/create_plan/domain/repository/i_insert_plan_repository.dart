import 'package:dartz/dartz.dart';
import 'package:innova_estetica/app/core/shared/exceptions/i_app_exception.dart';
import 'package:innova_estetica/app/features/create_plan/domain/entities/plan_entity.dart';

abstract class IInsertPlanRepository {
  Future<Either<IAppException, int>> call(PlanEntity params);
}
