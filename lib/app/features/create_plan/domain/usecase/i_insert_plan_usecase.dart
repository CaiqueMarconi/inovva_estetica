import 'package:dartz/dartz.dart';
import 'package:innova_estetica/app/features/create_plan/domain/repository/i_insert_plan_repository.dart';

import '../../../../core/shared/exceptions/i_app_exception.dart';
import '../entities/plan_entity.dart';

abstract class IInsertPlanUsecase {
  Future<Either<IAppException, int>> call(PlanEntity params);
}

class InsertPlanUsecaseImpl extends IInsertPlanUsecase {
  final IInsertPlanRepository _repository;

  InsertPlanUsecaseImpl(this._repository);
  @override
  Future<Either<IAppException, int>> call(PlanEntity params) async {
    final result = await _repository.call(params);
    return result;
  }
}
