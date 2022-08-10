import 'package:innova_estetica/app/features/control_cash/external/model/payment_model.dart';

abstract class IGetPaymentsDatasource {
  Future<List<PaymentModel>> getPayments();
}
