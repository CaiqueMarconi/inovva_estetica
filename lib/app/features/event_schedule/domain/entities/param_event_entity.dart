import 'package:equatable/equatable.dart';

class ParamEventEntity extends Equatable {
  final int idClient;
  final int idBeautician;
  final String description;
  final String timeInitial;
  final String timeFinal;
  const ParamEventEntity({
    required this.idClient,
    required this.idBeautician,
    required this.description,
    required this.timeInitial,
    required this.timeFinal,
  });

  @override
  List<Object?> get props => [
        idClient,
        idBeautician,
        description,
        timeFinal,
        timeInitial,
      ];
}
