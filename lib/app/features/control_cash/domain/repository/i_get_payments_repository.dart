import 'package:dartz/dartz.dart';
import 'package:innova_estetica/app/core/shared/exceptions/i_app_exception.dart';
import 'package:innova_estetica/app/features/clients/domain/entities/payment_entity.dart';

abstract class IGetPaymentsRepository {
  Future<Either<IAppException, List<PaymentEntity>>> call();
}
