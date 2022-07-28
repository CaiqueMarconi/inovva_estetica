class RegistrationState {
  final bool enableButton;
  final bool addmeasurements;
  RegistrationState({
    required this.enableButton,
    required this.addmeasurements,
  });

  factory RegistrationState.init() => RegistrationState(
        enableButton: false,
        addmeasurements: false,
      );

  RegistrationState copyWith({
    bool? enableButton,
    String? messageCheck,
    bool? addmeasurements,
  }) {
    return RegistrationState(
      enableButton: enableButton ?? this.enableButton,
      addmeasurements: addmeasurements ?? this.addmeasurements,
    );
  }
}
