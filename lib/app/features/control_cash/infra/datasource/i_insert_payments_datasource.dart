import 'package:innova_estetica/app/features/control_cash/domain/entity/control_cash_entity.dart';

abstract class IInsertPaymentsDatasource {
  Future<int> call(ControlCashEntity params);
}
