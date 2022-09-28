import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:innova_estetica/app/core/user/domain/entities/user_entity.dart';
import 'package:innova_estetica/app/features/clients/domain/usecase/i_get_clients_usecase.dart';
import 'package:innova_estetica/app/features/event_schedule/domain/entities/param_event_entity.dart';
import 'package:innova_estetica/app/features/event_schedule/domain/usecase/i_get_event_usecase.dart';
import 'package:innova_estetica/app/features/event_schedule/domain/usecase/i_insert_event_usecase.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../domain/entities/meeting_entity.dart';
import 'event_state.dart';

// ignore: must_be_immutable
class EventStore extends StreamStore<Exception, EventState> {
  final IGetClientsUsecase _getClientsUsecase;
  final IInsertEventUsecase _insertEventUsecase;
  final IGetEventUsecase _getEventUsecase;
  EventStore(
    this._getClientsUsecase,
    this._insertEventUsecase,
    this._getEventUsecase,
  ) : super(EventState.init());

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

  Future<void> insertEvent(UserEntity user) async {
    final params = ParamEventEntity(
      idBeautician: user.id,
      timeInitial: '${state.dateFormat} ${timeInitialController.text}',
      timeFinal: '${state.dateFormat} ${timeFinalController.text}',
      description: procedimentController.text,
      idClient: state.listClients.first.id!,
    );
    final result = await _insertEventUsecase.call(params);
    result.fold(
      (l) => setError,
      (r) async {
        dayController.clear();
        timeInitialController.clear();
        timeFinalController.clear();
        procedimentController.clear();
      },
    );
    await getEvents();
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
    for (var i = 0; i < state.listEvent.length; i++) {
      final startTime = state.listEvent[i].timeInitial;
      final endTime = state.listEvent[i].timeFinal;
      final timeInitial = DateFormat('HH:mm').format(startTime);
      final timeFinal = DateFormat('HH:mm').format(endTime);
      meetings.add(
        Meeting(
          'Cliente: ${state.listEvent[i].name} --- inicio: $timeInitial fim: $timeFinal',
          startTime,
          endTime,
          state.listEvent[i].idbeautician == 2
              ? Colors.red
              : state.listEvent[i].idbeautician == 4
                  ? Colors.blue
                  : Colors.green,
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
