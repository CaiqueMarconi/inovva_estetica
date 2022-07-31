import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:innova_estetica/app/features/clients/domain/usecase/i_get_clients_usecase.dart';
import 'package:innova_estetica/app/features/event_schedule/domain/usecase/i_get_event_usecase.dart';
import 'package:innova_estetica/app/features/event_schedule/domain/usecase/i_insert_event_usecase.dart';
import 'package:innova_estetica/app/features/event_schedule/stores/event_state.dart';

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

  List<Meeting> getDataSource() {
    List<Meeting> meetings = [];
    final DateTime today = DateTime.now();
    final DateTime startTime = DateTime(today.year, today.month, today.day, 13, 10, 5);

    final DateTime endTime = startTime.add(const Duration(hours: 5));
    meetings.add(Meeting('Amanda $startTime - $endTime', startTime, endTime, Colors.green, false));
    meetings.add(Meeting('Jussara', startTime, endTime, Colors.red, false));
    return meetings;
  }

  Future<void> getClients() async {
    final result = await _getClientsUsecase.call();
    result.fold(
      (l) => print('falha ao obter clients'),
      (r) => update(
        state.copyWith(listClients: r),
      ),
    );
  }
}
