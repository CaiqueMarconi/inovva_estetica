import 'package:equatable/equatable.dart';

class ClientDataEntity extends Equatable {
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

  const ClientDataEntity({
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
  });

  @override
  List<Object?> get props => [
        name,
        weight,
        age,
        plan,
        procediment,
        qtdSections,
        height,
        waist,
        abdomen,
        hip,
        birthData,
        beauticianId,
        cpf,
      ];
}
