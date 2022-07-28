import 'package:dartz/dartz.dart';
import 'package:innova_estetica/app/core/shared/exceptions/i_app_exception.dart';
import 'package:innova_estetica/app/features/create_plan/domain/entities/plan_entity.dart';

import '../repository/i_get_plans_repository.dart';

abstract class IGetPlansUsecase {
  Future<Either<IAppException, List<PlanEntity>>> call();
}

class GetPlansUsecaseImpl implements IGetPlansUsecase {
  final IGetPlansRepository _repository;

  GetPlansUsecaseImpl(this._repository);

  @override
  Future<Either<IAppException, List<PlanEntity>>> call() async {
    final result = await _repository.call();
    return result;
  }
}
