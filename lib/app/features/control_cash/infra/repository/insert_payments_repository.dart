import 'package:innova_estetica/app/features/control_cash/domain/entity/control_cash_entity.dart';
import 'package:innova_estetica/app/core/shared/exceptions/i_app_exception.dart';
import 'package:dartz/dartz.dart';
import 'package:innova_estetica/app/features/control_cash/domain/repository/i_insert_payments_repository.dart';
import 'package:innova_estetica/app/features/control_cash/infra/datasource/i_insert_payments_datasource.dart';

import '../../../../core/shared/exceptions/app_exception.dart';

class InsertPaymentsRepository implements IInsertPaymentsRepository {
  final IInsertPaymentsDatasource _datasource;

  InsertPaymentsRepository(this._datasource);

  @override
  Future<Either<IAppException, int>> call(ControlCashEntity params) async {
    try {
      final result = await _datasource.call(params);
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
