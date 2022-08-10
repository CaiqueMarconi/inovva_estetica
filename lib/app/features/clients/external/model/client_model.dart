import 'package:innova_estetica/app/features/clients/domain/entities/client_entity.dart';

class ClientModel extends ClientEntity {
  final String name;
  final int? id;
  final String? cpf;
  final String? birthData;
  final int? age;
  final double? currentWeight;
  final double? height;
  final double? hip;
  final int? idBeautician;
  final String? plan;
  final String? procediment;
  final int? qtdSections;
  final double? waist;
  final double? weight;
  final double? abdomen;
  final String? cep;
  final String? city;
  final String? district;
  final int? number;
  final String? road;
  ClientModel({
    required this.name,
    required this.id,
    required this.cpf,
    required this.birthData,
    required this.age,
    required this.currentWeight,
    required this.height,
    required this.hip,
    required this.idBeautician,
    required this.plan,
    required this.procediment,
    required this.qtdSections,
    required this.waist,
    required this.weight,
    required this.abdomen,
    required this.cep,
    required this.city,
    required this.district,
    required this.number,
    required this.road,
  }) : super(
          name: name,
          id: id,
          cpf: cpf,
          birthData: birthData,
          age: age,
          currentWeight: currentWeight,
          height: height,
          hip: hip,
          idBeautician: idBeautician,
          plan: plan,
          procediment: procediment,
          qtdSections: qtdSections,
          waist: waist,
          weight: weight,
          abdomen: abdomen,
          cep: cep,
          city: city,
          district: district,
          number: number,
          road: road,
        );

  factory ClientModel.fromMap(Map<String, dynamic> map) {
    return ClientModel(
      name: map['name'] ?? '',
      id: map['id'] ?? 0,
      cpf: map['cpf'] ?? '',
      birthData: map['birth_data'] ?? '',
      age: map['age'] ?? 0,
      currentWeight: map['measurements']?['weight_initial'] ?? 0,
      height: map['measurements']?['height_initial'] ?? 0,
      hip: map['measurements']?['hip_initial'] ?? 0,
      idBeautician: map['id_beautician'] ?? 0,
      plan: map['plan'] ?? '',
      procediment: map['procediment'] ?? '',
      qtdSections: map['qtd_sections'] ?? 0,
      waist: map['measurements']?['waist_initial'] ?? 0,
      weight: map['measurements']?['weight_initial'] ?? 0,
      abdomen: map['measurements']?['abdomen_initial'] ?? 0,
      cep: map['adress']?['cep'] ?? '',
      city: map['adress']?['city'] ?? '',
      district: map['adress']?['district'] ?? '',
      number: map['adress']?['number'] ?? 0,
      road: map['adress']?['road'] ?? '',
    );
  }
}
