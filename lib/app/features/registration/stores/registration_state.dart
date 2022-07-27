class RegistrationState {
  final bool enableButton;
  RegistrationState({
    required this.enableButton,
  });

  factory RegistrationState.init() => RegistrationState(enableButton: false);

  RegistrationState copyWith({
    bool? enableButton,
  }) {
    return RegistrationState(
      enableButton: enableButton ?? this.enableButton,
    );
  }
}
