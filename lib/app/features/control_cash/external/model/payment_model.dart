import 'package:innova_estetica/app/features/clients/domain/entities/payment_entity.dart';

class PaymentModel extends PaymentEntity {
  final String name;
  final DateTime date;
  final String formPayment;
  const PaymentModel({
    required this.name,
    required this.date,
    required this.formPayment,
  }) : super(
          name: name,
          date: date,
          formPayment: formPayment,
        );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'created_at': date.millisecondsSinceEpoch,
      'forms_payment': formPayment,
    };
  }

  factory PaymentModel.fromMap(Map<String, dynamic> map) {
    return PaymentModel(
      name: map['clients']['name'],
      date: DateTime.parse(map['created_at']),
      formPayment: map['forms_payment'],
    );
  }
}
