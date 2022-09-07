import 'package:dartz/dartz.dart';
import 'package:innova_estetica/app/core/shared/exceptions/i_app_exception.dart';
import 'package:innova_estetica/app/features/control_cash/domain/entity/payment_entity.dart';
import 'package:innova_estetica/app/features/control_cash/domain/repository/i_get_payments_repository.dart';

abstract class IGetPaymentsUsecase {
  Future<Either<IAppException, List<PaymentEntity>>> call();
}

class GetPaymentsUsecaseImpl implements IGetPaymentsUsecase {
  final IGetPaymentsRepository _repository;

  GetPaymentsUsecaseImpl(this._repository);

  @override
  Future<Either<IAppException, List<PaymentEntity>>> call() async {
    final result = await _repository.call();
    return result;
  }
}
