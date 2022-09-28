import 'package:innova_estetica/app/features/create_plan/domain/entities/plan_entity.dart';
import 'package:innova_estetica/app/core/shared/exceptions/i_app_exception.dart';
import 'package:dartz/dartz.dart';
import 'package:innova_estetica/app/features/create_plan/domain/repository/i_insert_plan_repository.dart';
import '../../../../core/shared/exceptions/app_exception.dart';
import '../datasource/i_insert_plan_datasource.dart';

class InsertPlanRepositoryImpl implements IInsertPlanRepository {
  final IInsertPlanDatasource _datasource;

  InsertPlanRepositoryImpl(this._datasource);
  @override
  Future<Either<IAppException, int>> call(PlanEntity params) async {
    try {
      final result = await _datasource.insertPlan(params);
      return Right(result);
    } on IAppException catch (e) {
      return Left(e);
    } catch (e, s) {
      return Left(
        AppException(message: e.toString(), stackTrace: s),
      );
    }
  }
}
