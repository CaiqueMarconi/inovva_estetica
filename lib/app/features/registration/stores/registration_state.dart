import 'package:innova_estetica/app/features/create_plan/domain/entities/plan_entity.dart';

class RegistrationState {
  final bool enableButton;
  final bool addmeasurements;
  final List<PlanEntity> listPlans;
  RegistrationState({
    required this.enableButton,
    required this.addmeasurements,
    required this.listPlans,
  });

  factory RegistrationState.init() => RegistrationState(
        enableButton: false,
        addmeasurements: false,
        listPlans: [],
      );

  RegistrationState copyWith({
    bool? enableButton,
    bool? addmeasurements,
    List<PlanEntity>? listPlans,
  }) {
    return RegistrationState(
      enableButton: enableButton ?? this.enableButton,
      addmeasurements: addmeasurements ?? this.addmeasurements,
      listPlans: listPlans ?? this.listPlans,
    );
  }
}
