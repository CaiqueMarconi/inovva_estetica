import 'package:innova_estetica/app/features/event_schedule/domain/entities/event_entity.dart';

class EventModel extends EventEntity {
  final DateTime timeInitial;
  final DateTime timeFinal;
  final String description;
  final String name;
  final int idClient;
  final int idbeautician;
  const EventModel({
    required this.timeInitial,
    required this.timeFinal,
    required this.description,
    required this.name,
    required this.idClient,
    required this.idbeautician,
  }) : super(
          timeInitial: timeInitial,
          timeFinal: timeFinal,
          description: description,
          name: name,
          idClient: idClient,
          idbeautician: idbeautician,
        );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'timeInitial': timeInitial.millisecondsSinceEpoch,
      'timeFinal': timeFinal.millisecondsSinceEpoch,
      'description': description,
      'name': name,
      'id_client': idClient,
    };
  }

  factory EventModel.fromMap(Map<String, dynamic> map) {
    return EventModel(
        timeInitial: DateTime.parse(map['time_initial'].toString()),
        timeFinal: DateTime.parse(map['time_final'].toString()),
        description: map['description'],
        idClient: map['id_client'] ?? 0,
        name: map['clients']?['name'] ?? '',
        idbeautician: map['id_beautician']);
  }
}
