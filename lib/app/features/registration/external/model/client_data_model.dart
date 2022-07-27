import 'package:innova_estetica/app/features/registration/domain/entities/client_data_entity.dart';

class ClientDataModel extends ClientDataEntity {
  final String name;
  final double? weight;
  final int? age;
  final String? plan;
  final String? procediment;
  final int? qtdSections;
  final double? height;
  final double? waist;
  final double? abdomen;
  final double? hip;
  final String? birthData;
  final int? beauticianId;
  final String? cpf;

  const ClientDataModel({
    required this.name,
    this.weight,
    this.age,
    this.plan,
    this.procediment,
    this.qtdSections,
    this.height,
    this.waist,
    this.abdomen,
    this.hip,
    this.birthData,
    this.beauticianId,
    this.cpf,
  }) : super(
          name: name,
          weight: weight,
          age: age,
          plan: plan,
          procediment: procediment,
          qtdSections: qtdSections,
          height: height,
          waist: waist,
          abdomen: abdomen,
          hip: hip,
          birthData: birthData,
          beauticianId: beauticianId,
          cpf: cpf,
        );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'weight': weight,
      'age': age,
      'plan': plan,
      'procediment': procediment,
      'qtd_sections': qtdSections,
      'height': height,
      'waist': waist,
      'abdomen': abdomen,
      'hip': hip,
      'birth_data': birthData,
      'id_beautician': beauticianId,
      'cpf': cpf,
    };
  }

  factory ClientDataModel.fromMap(Map<String, dynamic> map) {
    return ClientDataModel(
      name: map['name'] as String,
      weight: map['weight'] as double,
      age: map['age'] as int,
      plan: map['plan'] as String,
      procediment: map['procediment'] as String,
      qtdSections: map['qtdSections'] as int,
      height: map['height'] as double,
      waist: map['waist'] as double,
      abdomen: map['abdomen'] as double,
      hip: map['hip'] as double,
      birthData: map['birth_data'] as String,
      beauticianId: map['id_beautician'],
      cpf: map['cpf'],
    );
  }
}
