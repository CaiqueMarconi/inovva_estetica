import 'package:dartz/dartz.dart';
import 'package:innova_estetica/app/core/shared/exceptions/app_exception.dart';
import 'package:innova_estetica/app/core/shared/exceptions/i_app_exception.dart';
import 'package:innova_estetica/app/features/control_cash/domain/entity/payment_entity.dart';

import '../../domain/repository/i_get_payments_repository.dart';
import '../datasource/i_get_payments_datasource.dart';

class GetPaymentsRepositoryImpl implements IGetPaymentsRepository {
  final IGetPaymentsDatasource _datasource;

  GetPaymentsRepositoryImpl(this._datasource);

  @override
  Future<Either<IAppException, List<PaymentEntity>>> call() async {
    try {
      final result = await _datasource.getPayments();
      return Right(result);
    } catch (e, s) {
      return Left(
        AppException(
          message: e.toString(),
          stackTrace: s,
        ),
      );
    }
  }
}
