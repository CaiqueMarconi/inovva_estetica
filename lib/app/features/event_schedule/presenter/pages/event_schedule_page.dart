import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:innova_estetica/app/core/widgets/text_form_field_custom.dart';
import 'package:innova_estetica/app/features/event_schedule/stores/event_store.dart';
import 'package:innova_estetica/app/features/registration/presenter/pages/registration_page.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../external/datasource/meeting_datasource.dart';

class EventSchedulePage extends StatelessWidget {
  EventSchedulePage({
    Key? key,
  }) : super(key: key);
  final eventStore = Modular.get<EventStore>();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return ScopedBuilder(
      store: eventStore,
      onState: (context, state) {
        return !eventStore.state.showForm
            ? Scaffold(
                body: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SfCalendar(
                    view: CalendarView.week,
                    dataSource: MeetingDataSource(eventStore.getDataSource()),
                    monthViewSettings: const MonthViewSettings(
                      appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
                    ),
                    showNavigationArrow: true,
                    showCurrentTimeIndicator: false,
                  ),
                ),
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    eventStore.showFormAddEvent();
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
                              labelText: 'Cliente',
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
                          eventStore.showFormAddEvent();
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
