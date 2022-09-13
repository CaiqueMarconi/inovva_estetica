// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class PaymentEntity extends Equatable {
  final String name;
  final DateTime date;
  final String formPayment;
  final String description;
  const PaymentEntity({
    required this.name,
    required this.date,
    required this.formPayment,
    required this.description,
  });

  @override
  List<Object?> get props => [
        name,
        date,
        formPayment,
        description,
      ];
}
