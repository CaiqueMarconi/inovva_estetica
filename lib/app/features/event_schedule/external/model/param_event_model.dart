import 'package:innova_estetica/app/features/event_schedule/domain/entities/param_event_entity.dart';

class ParamEventModel extends ParamEventEntity {
  final int idClient;
  final String description;
  final String timeInitial;
  final String timeFinal;
  const ParamEventModel({
    required this.idClient,
    required this.description,
    required this.timeInitial,
    required this.timeFinal,
  }) : super(
          idClient: idClient,
          description: description,
          timeInitial: timeInitial,
          timeFinal: timeFinal,
        );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id_client': idClient,
      'description': description,
      'time_initial': timeInitial,
      'time_final': timeFinal,
    };
  }

  factory ParamEventModel.fromMap(Map<String, dynamic> map) {
    return ParamEventModel(
      idClient: map['id_client'] as int,
      description: map['description'] as String,
      timeInitial: map['time_initial'],
      timeFinal: map['time_final'],
    );
  }
}
