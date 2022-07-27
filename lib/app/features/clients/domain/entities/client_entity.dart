import 'package:equatable/equatable.dart';

class ClientEntity implements Equatable {
  final String name;
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
  ClientEntity({
    required this.name,
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
  });

  @override
  List<Object?> get props => [
        name,
        cpf,
        birthData,
        age,
        currentWeight,
        height,
        hip,
        idBeautician,
        plan,
        procediment,
        qtdSections,
        waist,
        weight,
        abdomen,
        cep,
        city,
        district,
        number,
        road,
      ];

  @override
  bool? get stringify => throw UnimplementedError();
}
