import 'package:equatable/equatable.dart';

class MeasurementsEntity extends Equatable {
  final double? weightInitial;
  final double? hipInitial;
  final double? waistInitial;
  final double? abdomenInitial;
  final double? height;
  final int? idClient;
  const MeasurementsEntity({
    this.weightInitial,
    this.hipInitial,
    this.waistInitial,
    this.abdomenInitial,
    this.height,
    this.idClient,
  });

  @override
  List<Object?> get props => [
        weightInitial,
        hipInitial,
        waistInitial,
        abdomenInitial,
        height,
        idClient,
      ];
}
