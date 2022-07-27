class RegistrationState {
  final bool enableButton;
  //final String messageCheck;
  RegistrationState({
    required this.enableButton,
    //required this.messageCheck,
  });

  factory RegistrationState.init() => RegistrationState(
        enableButton: false,
        // messageCheck: '',
      );

  RegistrationState copyWith({
    bool? enableButton,
    String? messageCheck,
  }) {
    return RegistrationState(
      enableButton: enableButton ?? this.enableButton,
      // messageCheck: messageCheck ?? this.messageCheck,
    );
  }
}
