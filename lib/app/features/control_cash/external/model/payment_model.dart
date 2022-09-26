import 'package:innova_estetica/app/features/control_cash/domain/entity/payment_entity.dart';

class PaymentModel extends PaymentEntity {
  final String name;
  final DateTime date;
  final String formPayment;
  final String description;
  final double value;

  final String descValueInputed;
  const PaymentModel({
    required this.name,
    required this.date,
    required this.formPayment,
    required this.description,
    required this.value,
    required this.descValueInputed,
  }) : super(
          name: name,
          date: date,
          formPayment: formPayment,
          description: description,
          value: value,
          descValueInputed: descValueInputed,
        );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'created_at': date.millisecondsSinceEpoch,
      'forms_payment': formPayment,
      'description': description,
    };
  }

  factory PaymentModel.fromMap(Map<String, dynamic> map) {
    return PaymentModel(
      name: map['clients']?['name'] ?? '',
      date: DateTime.parse(map['created_at']),
      formPayment: map['forms_payment'],
      description: map['description'] ?? '',
      value: map['input_value'] ?? 0,
      descValueInputed: map['description_value_inputed'] ?? '',
    );
  }
}
