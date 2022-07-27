// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class AdressEntity extends Equatable {
  final String? cep;
  final String? district;
  final String? road;
  final int? idClient;
  final int? number;
  const AdressEntity({
    this.cep,
    this.district,
    this.road,
    this.idClient,
    this.number,
  });

  @override
  List<Object?> get props => [
        cep,
        district,
        road,
        idClient,
        number,
      ];
}
