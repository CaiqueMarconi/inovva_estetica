import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:innova_estetica/app/core/user/store/user_store.dart';
import 'package:innova_estetica/app/features/clients/domain/usecase/i_get_clients_usecase.dart';
import 'package:innova_estetica/app/features/event_schedule/domain/entities/event_entity.dart';
import 'package:innova_estetica/app/features/event_schedule/domain/entities/param_event_entity.dart';
import 'package:innova_estetica/app/features/event_schedule/domain/usecase/i_get_event_usecase.dart';
import 'package:innova_estetica/app/features/event_schedule/domain/usecase/i_insert_event_usecase.dart';
import 'package:innova_estetica/app/features/event_schedule/stores/event_state.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../domain/entities/meeting_entity.dart';

class EventStore extends StreamStore<Exception, EventState> {
  final IGetClientsUsecase _getClientsUsecase;
  final IInsertEventUsecase _insertEventUsecase;
  final IGetEventUsecase _getEventUsecase;
  EventStore(
    this._getClientsUsecase,
    this._insertEventUsecase,
    this._getEventUsecase,
  ) : super(EventState.init());

  TextEditingController nameClientController = TextEditingController();
  TextEditingController procedimentController = TextEditingController();
  TextEditingController dayController = TextEditingController();
  TextEditingController timeInitialController = TextEditingController();
  TextEditingController timeFinalController = TextEditingController();

  void showFormAddEvent() {
    update(state.copyWith(showForm: !state.showForm));
    if (kDebugMode) {
      print(state.showForm);
    }
  }

  void changeVisualization(CalendarView calendarView) {
    update(state.copyWith(visualizationCalendar: calendarView));
  }

  void changeDay(DateTime day) {
    final dateFormat = DateFormat('yyyy-MM-dd').format(day).replaceAll('00', '').replaceAll(':', '');
    update(state.copyWith(dateFormat: dateFormat));
    final stringFormat = DateFormat('dd-MM-yyyy').format(day).toString();
    dayController.text = stringFormat;
  }

  Future<void> insertEvent() async {
    final params = ParamEventEntity(
      timeInitial: '${state.dateFormat} ${timeInitialController.text}',
      timeFinal: '${state.dateFormat} ${timeFinalController.text}',
      description: procedimentController.text,
      idClient: state.listClients.first.id!,
    );
    final result = await _insertEventUsecase.call(params);
    result.fold(
      (l) => setError,
      (r) {
        dayController.clear();
        timeInitialController.clear();
        timeFinalController.clear();
        procedimentController.clear();
      },
    );
  }

  Future<void> getEvents() async {
    final result = await _getEventUsecase.call();
    result.fold(
      (l) => setError,
      (r) => update(
        state.copyWith(listEvent: r),
      ),
    );
  }

  List<Meeting> getDataSource() {
    List<Meeting> meetings = [];
    final DateTime today = DateTime.now();
    final DateTime startTime = DateTime(today.year, today.month, today.day);

    final DateTime endTime = startTime.add(const Duration(hours: 5));
    for (var i = 0; i < state.listEvent.length; i++) {
      final startTime = DateTime.parse(state.listEvent[i].timeInitial.toString());
      final timeDuration = state.listEvent[i].timeFinal.difference(
        state.listEvent[i].timeInitial,
      );
      final dateFormat = DateFormat('yyyy-MM-dd').format(state.listEvent[i].timeInitial);
      meetings.add(
        Meeting(
          '${state.listEvent[i].name} $startTime - $endTime',
          startTime,
          DateTime.parse('$dateFormat 0${timeDuration}z'),
          Colors.green,
          false,
        ),
      );
    }
    return meetings;
  }

  Future<void> getClients() async {
    final result = await _getClientsUsecase.call();
    result.fold(
      (l) => setError,
      (r) => update(
        state.copyWith(listClients: r),
      ),
    );
  }
}
