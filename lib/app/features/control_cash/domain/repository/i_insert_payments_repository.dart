import 'package:dartz/dartz.dart';

import '../../../../core/shared/exceptions/i_app_exception.dart';
import '../entity/control_cash_entity.dart';

abstract class IInsertPaymentsRepository {
  Future<Either<IAppException, int>> call(ControlCashEntity params);
}
