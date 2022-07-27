// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:innova_estetica/app/features/create_plan/domain/entities/plan_entity.dart';

class PlanModel extends PlanEntity {
  final String namePlan;
  final String description;
  final int qtdSections;
  const PlanModel({
    required this.namePlan,
    required this.description,
    required this.qtdSections,
  }) : super(
          namePlan: namePlan,
          description: description,
          qtdSections: qtdSections,
        );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': namePlan,
      'description': description,
      'qtd_sections': qtdSections,
    };
  }

  factory PlanModel.fromMap(Map<String, dynamic> map) {
    return PlanModel(
      namePlan: map['name'],
      description: map['description'],
      qtdSections: map['qtd_sections'],
    );
  }
}
