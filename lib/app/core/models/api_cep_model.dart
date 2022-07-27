import 'package:innova_estetica/app/core/models/api_cep_entity.dart';

class ApiCepModel extends ApiCepEntity {
  final String publicPlace;
  final String district;
  final String city;
  const ApiCepModel({
    required this.publicPlace,
    required this.district,
    required this.city,
  }) : super(
          publicPlace: publicPlace,
          district: district,
          city: city,
        );

  factory ApiCepModel.fromMap(Map<String, dynamic> map) {
    return ApiCepModel(
      publicPlace: map['logradouro'] as String,
      district: map['bairro'] as String,
      city: map['localidade'] as String,
    );
  }
}
