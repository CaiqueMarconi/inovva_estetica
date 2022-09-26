// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class PaymentEntity extends Equatable {
  final String name;
  final DateTime date;
  final String formPayment;
  final String description;
  final double value;
  final String descValueInputed;
  const PaymentEntity({
    required this.name,
    required this.date,
    required this.formPayment,
    required this.description,
    required this.value,
    required this.descValueInputed,
  });

  @override
  List<Object?> get props => [
        name,
        date,
        formPayment,
        description,
        value,
      ];
}
