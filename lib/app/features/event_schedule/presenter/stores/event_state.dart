import 'package:innova_estetica/app/features/clients/domain/entities/client_entity.dart';
import 'package:innova_estetica/app/features/event_schedule/domain/entities/event_entity.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class EventState {
  final bool showForm;
  final List<ClientEntity> listClients;
  final CalendarView visualizationCalendar;
  final String dateFormat;
  final List<EventEntity> listEvent;
  EventState({
    required this.showForm,
    required this.listClients,
    required this.visualizationCalendar,
    required this.dateFormat,
    required this.listEvent,
  });

  factory EventState.init() => EventState(
        showForm: false,
        listClients: [],
        visualizationCalendar: CalendarView.month,
        dateFormat: '',
        listEvent: [],
      );

  EventState copyWith({
    bool? showForm,
    List<ClientEntity>? listClients,
    CalendarView? visualizationCalendar,
    String? dateFormat,
    List<EventEntity>? listEvent,
  }) {
    return EventState(
      showForm: showForm ?? this.showForm,
      listClients: listClients ?? this.listClients,
      visualizationCalendar: visualizationCalendar ?? this.visualizationCalendar,
      dateFormat: dateFormat ?? this.dateFormat,
      listEvent: listEvent ?? this.listEvent,
    );
  }
}
