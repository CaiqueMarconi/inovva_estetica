import 'package:calendar_view/calendar_view.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:innova_estetica/app/core/widgets/text_form_field_custom.dart';
import 'package:innova_estetica/app/features/clients/domain/entities/client_entity.dart';
import 'package:innova_estetica/app/features/event_schedule/stores/event_store.dart';
import 'package:innova_estetica/app/features/registration/presenter/pages/registration_page.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../../../core/utils/const/strings_colors.dart';
import '../../external/datasource/meeting_datasource.dart';

class EventSchedulePage extends StatefulWidget {
  const EventSchedulePage({
    Key? key,
  }) : super(key: key);

  @override
  State<EventSchedulePage> createState() => _EventSchedulePageState();
}

class _EventSchedulePageState extends State<EventSchedulePage> {
  final eventStore = Modular.get<EventStore>();

  @override
  void initState() {
    eventStore.getClients();
    eventStore.getEvents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print(DateTime.parse('2022-08-11 19:06').difference(
    //   DateTime.parse(
    //     '2022-08-11 21:06',
    //   ),
    // ));
    final width = MediaQuery.of(context).size.width;
    return ScopedBuilder(
      store: eventStore,
      onState: (context, state) {
        return !eventStore.state.showForm
            ? Scaffold(
                body: SingleChildScrollView(
                  child: Stack(
                    children: [
                      ScopedBuilder(
                        store: eventStore,
                        onState: (context, state) {
                          return Container(
                            height: width * 0.57,
                            padding: EdgeInsets.all(width * 0.010),
                            child: SfCalendar(
                              view: eventStore.state.visualizationCalendar,
                              dataSource: MeetingDataSource(eventStore.getDataSource()),
                              monthViewSettings: const MonthViewSettings(
                                appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
                                showAgenda: true,
                              ),
                              showNavigationArrow: true,
                              showCurrentTimeIndicator: false,
                            ),
                          );
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: width * 0.005),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButtonCustom(
                              width: width,
                              text: 'Mês',
                              function: () {
                                eventStore.changeVisualization(CalendarView.month);
                              },
                            ),
                            SizedBox(width: width * 0.010),
                            ElevatedButtonCustom(
                              width: width,
                              text: 'Semana',
                              function: () {
                                eventStore.changeVisualization(CalendarView.week);
                                print(eventStore.state.visualizationCalendar);
                              },
                            ),
                            SizedBox(width: width * 0.010),
                            ElevatedButtonCustom(
                              width: width,
                              text: 'Dia',
                              function: () {
                                eventStore.changeVisualization(CalendarView.day);
                              },
                            ),
                            SizedBox(width: width * 0.005),
                          ],
                        ),
                      ),
                    ],
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
                            child: DropdownButtonFormField<ClientEntity>(
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: StringColors.pinkClear,
                                    width: 2,
                                  ),
                                ),
                                labelText: 'Selecione o cliente',
                                labelStyle: TextStyle(
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              items: eventStore.state.listClients.map((ClientEntity dropDownStringItem) {
                                return DropdownMenuItem<ClientEntity>(
                                  value: dropDownStringItem,
                                  child: Text(dropDownStringItem.name),
                                );
                              }).toList(),
                              onChanged: (newIten) {
                                setState(() {
                                  eventStore.state.listClients.removeWhere((element) => element == newIten);
                                  eventStore.state.listClients.insert(0, newIten!);
                                  // registrationStore.procedimentController!.text = newIten.description;
                                  // registrationStore.qtdSectionsController!.text = newIten.qtdSections.toString();
                                });
                              },
                              value: eventStore.state.listClients.first,
                            ),
                          ),
                          SizedBox(width: width * 0.010),
                          Expanded(
                            child: TextFormFieldCustom(
                              labelText: 'Procedimento',
                              controller: eventStore.procedimentController,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: width * 0.010),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormFieldCustom(
                              controller: eventStore.dayController,
                              onTap: () {
                                showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      contentPadding: EdgeInsets.all(0),
                                      title: const Text('Escolha o dia'),
                                      content: SizedBox(
                                          width: width * 0.20,
                                          height: width * 0.20,
                                          child: SfCalendar(
                                            view: CalendarView.month,
                                            onTap: (value) {
                                              print(value.date);
                                              eventStore.changeDay(value.date!);
                                            },
                                          )),
                                      actions: <Widget>[
                                        // TextButton(
                                        //   child: const Text('Não'),
                                        //   onPressed: () {
                                        //     Navigator.of(context).pop();
                                        //   },
                                        // ),
                                        TextButton(
                                          child: const Text('Confirmar!'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              labelText: 'Dia',
                            ),
                          ),
                          SizedBox(width: width * 0.010),
                          Expanded(
                            child: DateTimePicker(
                              controller: eventStore.timeInitialController,
                              decoration: const InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: StringColors.pinkClear,
                                    width: 2,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: StringColors.pinkClear,
                                    width: 2,
                                  ),
                                ),
                                labelText: 'Horario Inicial',
                                labelStyle: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: StringColors.pinkClear,
                                ),
                              ),
                              autofocus: true,
                              type: DateTimePickerType.time,
                              onChanged: (val) => print(val),
                              validator: (val) {
                                return null;
                              },
                              onSaved: (val) => print(val),
                            ),
                          ),
                          SizedBox(width: width * 0.010),
                          Expanded(
                            child: DateTimePicker(
                              controller: eventStore.timeFinalController,
                              decoration: const InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: StringColors.pinkClear,
                                    width: 2,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: StringColors.pinkClear,
                                    width: 2,
                                  ),
                                ),
                                labelText: 'Horario Final',
                                labelStyle: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: StringColors.pinkClear,
                                ),
                              ),
                              autofocus: true,
                              type: DateTimePickerType.time,
                              onChanged: (val) => print(val),
                              validator: (val) {
                                return null;
                              },
                              onSaved: (val) => print(val),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: width * 0.020),
                      ElevatedButtonCustom(
                        width: width,
                        text: 'Criar',
                        function: () async {
                          await eventStore.insertEvent();
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
