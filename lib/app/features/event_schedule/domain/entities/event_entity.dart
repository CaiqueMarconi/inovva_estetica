import 'package:equatable/equatable.dart';

class EventEntity extends Equatable {
  final DateTime timeInitial;
  final DateTime timeFinal;
  final String description;
  final String name;
  final int idClient;
  const EventEntity({
    required this.timeInitial,
    required this.timeFinal,
    required this.description,
    required this.name,
    required this.idClient,
  });

  @override
  List<Object?> get props => [
        timeFinal,
        timeInitial,
        name,
        description,
        idClient,
      ];
}
