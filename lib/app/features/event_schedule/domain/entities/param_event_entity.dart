import 'package:equatable/equatable.dart';

class ParamEventEntity extends Equatable {
  final int idClient;
  final String description;
  final DateTime timeInitial;
  final DateTime timeFinal;
  const ParamEventEntity({
    required this.idClient,
    required this.description,
    required this.timeInitial,
    required this.timeFinal,
  });

  @override
  List<Object?> get props => [
        idClient,
        description,
        timeFinal,
        timeInitial,
      ];
}
