// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class ApiCepEntity extends Equatable {
  final String publicPlace;
  final String district;
  final String city;
  const ApiCepEntity({
    required this.publicPlace,
    required this.district,
    required this.city,
  });

  @override
  List<Object?> get props => [
        publicPlace,
        district,
        city,
      ];
}
