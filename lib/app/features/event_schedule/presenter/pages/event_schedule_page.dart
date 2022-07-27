import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:innova_estetica/app/core/widgets/text_form_field_custom.dart';
import 'package:innova_estetica/app/features/event_schedule/stores/event_store.dart';
import 'package:innova_estetica/app/features/registration/presenter/pages/registration_page.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class EventSchedulePage extends StatelessWidget {
  EventSchedulePage({
    Key? key,
  }) : super(key: key);
  final evenStore = Modular.get<EventStore>();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return ScopedBuilder(
      store: evenStore,
      onState: (context, state) {
        return !evenStore.state.showForm
            ? Scaffold(
                body: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: SfCalendar(
                    view: CalendarView.week,
                    dataSource: MeetingDataSource(_getDataSource()),
                    monthViewSettings: const MonthViewSettings(
                      appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
                    ),
                    showNavigationArrow: true,
                    showCurrentTimeIndicator: false,
                  ),
                ),
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    evenStore.showFormAddEvent();
                  },
                  child: const Icon(Icons.add),
                ),
              )
            : Center(
                child: SizedBox(
                  width: width * 0.6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //SizedBox(height: width * 0.030),
                      TextTitleComum(width: width, textTitle: 'Criar Agendamento'),
                      SizedBox(height: width * 0.030),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormFieldCustom(
                              labelText: 'Paciente',
                              controller: TextEditingController(),
                            ),
                          ),
                          SizedBox(width: width * 0.010),
                          Expanded(
                            child: TextFormFieldCustom(
                              labelText: 'Procedimento',
                              controller: TextEditingController(),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: width * 0.010),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormFieldCustom(
                              labelText: 'Dia',
                              controller: TextEditingController(),
                            ),
                          ),
                          SizedBox(width: width * 0.010),
                          Expanded(
                            child: TextFormFieldCustom(
                              labelText: 'Horario Inicial',
                              controller: TextEditingController(),
                            ),
                          ),
                          SizedBox(width: width * 0.010),
                          Expanded(
                            child: TextFormFieldCustom(
                              labelText: 'Horario Final',
                              controller: TextEditingController(),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: width * 0.020),
                      ElevatedButtonCustom(
                        width: width,
                        text: 'Criar',
                        function: () {
                          evenStore.showFormAddEvent();
                        },
                      ),
                    ],
                  ),
                ),
              );
      },
    );
  }
}

List<Meeting> _getDataSource() {
  List<Meeting> meetings = [];
  final DateTime today = DateTime.now();
  final DateTime startTime = DateTime(today.year, today.month, today.day, 13, 10, 5);

  final DateTime endTime = startTime.add(const Duration(hours: 5));
  meetings.add(Meeting('Amanda\n$startTime - $endTime', startTime, endTime, Colors.green, false));
  meetings.add(Meeting('Jussara', startTime, endTime, Colors.red, false));
  return meetings;
}

class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(this.source);

  List<Meeting> source;

  @override
  List<dynamic> get appointments => source;

  @override
  DateTime getStartTime(int index) {
    return source[index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return source[index].to;
  }

  @override
  String getSubject(int index) {
    return source[index].eventName;
  }

  @override
  Color getColor(int index) {
    return source[index].background;
  }

  @override
  bool isAllDay(int index) {
    return source[index].isAllDay;
  }
}
