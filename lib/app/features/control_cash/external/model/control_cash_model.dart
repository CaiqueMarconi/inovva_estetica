import 'package:innova_estetica/app/features/control_cash/domain/entity/control_cash_entity.dart';

// ignore: must_be_immutable
class ControlCashModel extends ControlCashEntity {
  final int idBeautician;
  final String formPayment;
  final int idUser;
  final double valueInputed;
  final String descriptionValue;
  ControlCashModel({
    required this.idBeautician,
    required this.formPayment,
    required this.idUser,
    required this.valueInputed,
    required this.descriptionValue,
  }) : super(
          idBeautician: idBeautician,
          formPayment: formPayment,
          idUser: idUser,
          valueInputed: valueInputed,
          descriptionValue: descriptionValue,
        );

  factory ControlCashModel.fromMap(Map<String, dynamic> map) {
    return ControlCashModel(
      idBeautician: map['id_beautician'],
      formPayment: map['forms_payment'],
      idUser: map['id_user'],
      valueInputed: map['input_value'],
      descriptionValue: map['description_value_inputed'],
    );
  }
}
