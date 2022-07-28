import 'package:dartz/dartz.dart';
import 'package:innova_estetica/app/core/shared/exceptions/app_exception.dart';
import 'package:innova_estetica/app/core/shared/exceptions/i_app_exception.dart';
import 'package:innova_estetica/app/features/create_plan/domain/entities/plan_entity.dart';

import '../../domain/repository/i_get_plans_repository.dart';
import '../datasource/i_get_plans_datasource.dart';

class GetPlansRepositoryImpl implements IGetPlansRepository {
  final IGetPlansDatasource _datasource;

  GetPlansRepositoryImpl(this._datasource);

  @override
  Future<Either<IAppException, List<PlanEntity>>> call() async {
    try {
      final result = await _datasource.getPlans();
      return Right(result);
    } catch (e, s) {
      return Left(
        AppException(message: e.toString(), stackTrace: s),
      );
    }
  }
}
