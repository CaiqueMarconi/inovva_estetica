import 'package:flutter/foundation.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:innova_estetica/app/features/event_schedule/stores/event_state.dart';

class EventStore extends StreamStore<Exception, EventState> {
  EventStore() : super(EventState.init());

  void showFormAddEvent() {
    update(state.copyWith(showForm: !state.showForm));
    if (kDebugMode) {
      print(state.showForm);
    }
  }
}
