import 'package:dartz/dartz.dart';
import 'package:innova_estetica/app/core/shared/exceptions/i_app_exception.dart';
import 'package:innova_estetica/app/features/control_cash/domain/entity/control_cash_entity.dart';

import '../repository/i_insert_payments_repository.dart';

abstract class IInsertPaymentsUsecase {
  Future<Either<IAppException, int>> call(ControlCashEntity params);
}

class InsertPaymentsUsecase implements IInsertPaymentsUsecase {
  final IInsertPaymentsRepository _repository;

  InsertPaymentsUsecase(this._repository);
  @override
  Future<Either<IAppException, int>> call(ControlCashEntity params) async {
    final result = await _repository.call(params);
    return result;
  }
}
