import 'package:innova_estetica/app/features/registration/domain/entities/adress_entity.dart';

class AdressModel extends AdressEntity {
  final String? cep;
  final String? district;
  final String? road;
  final int? idClient;
  final int? number;
  const AdressModel({
    this.cep,
    this.district,
    this.road,
    this.idClient,
    this.number,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cep': cep,
      'road': road,
      'id_client': idClient,
      'number': number,
      'district': district,
    };
  }

  factory AdressModel.fromMap(Map<String, dynamic> map) {
    return AdressModel(
      cep: map['cep'] != null ? map['cep'] as String : null,
      district: map['district'] != null ? map['district'] as String : null,
      road: map['road'] != null ? map['road'] as String : null,
      idClient: map['idClient'] != null ? map['idClient'] as int : null,
      number: map['number'] != null ? map['number'] as int : null,
    );
  }
}
