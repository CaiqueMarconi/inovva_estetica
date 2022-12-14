import 'package:equatable/equatable.dart';

class PlanEntity extends Equatable {
  final String namePlan;
  final String description;
  final int qtdSections;
  const PlanEntity({
    required this.namePlan,
    required this.description,
    required this.qtdSections,
  });

  @override
  List<Object?> get props => [
        namePlan,
        description,
        qtdSections,
      ];
}
