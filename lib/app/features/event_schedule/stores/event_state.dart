class EventState {
  final bool showForm;
  EventState({
    required this.showForm,
  });

  factory EventState.init() => EventState(showForm: false);

  EventState copyWith({
    bool? showForm,
  }) {
    return EventState(
      showForm: showForm ?? this.showForm,
    );
  }
}
