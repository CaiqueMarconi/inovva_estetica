import 'package:innova_estetica/app/features/event_schedule/domain/entities/param_event_entity.dart';

class ParamEventModel extends ParamEventEntity {
  final int idClient;
  final String description;
  final DateTime timeInitial;
  final DateTime timeFinal;
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
      'time_initial': timeInitial.millisecondsSinceEpoch,
      'time_final': timeFinal.millisecondsSinceEpoch,
    };
  }

  factory ParamEventModel.fromMap(Map<String, dynamic> map) {
    return ParamEventModel(
      idClient: map['id_client'] as int,
      description: map['description'] as String,
      timeInitial: DateTime.fromMillisecondsSinceEpoch(map['time_initial'] as int),
      timeFinal: DateTime.fromMillisecondsSinceEpoch(map['time_final'] as int),
    );
  }
}
