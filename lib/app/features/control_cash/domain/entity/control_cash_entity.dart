import 'package:equatable/equatable.dart';

class ControlCashEntity extends Equatable {
  final int idBeautician;
  final String formPayment;
  final int idUser;
  final double valueInputed;
  final String descriptionValue;
  const ControlCashEntity({
    required this.idBeautician,
    required this.formPayment,
    required this.idUser,
    required this.valueInputed,
    required this.descriptionValue,
  });

  @override
  List<Object?> get props => [
        idBeautician,
        formPayment,
        idUser,
        valueInputed,
        descriptionValue,
      ];
}
