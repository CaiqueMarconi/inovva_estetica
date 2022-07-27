import 'package:innova_estetica/app/features/registration/domain/entities/measurements_entity.dart';

class MeasurementsModel extends MeasurementsEntity {
  final double? weightInitial;
  final double? hipInitial;
  final double? waistInitial;
  final double? abdomenInitial;
  final double? height;
  final int? idClient;
  const MeasurementsModel({
    this.weightInitial,
    this.hipInitial,
    this.waistInitial,
    this.abdomenInitial,
    this.height,
    this.idClient,
  }) : super(
          weightInitial: weightInitial,
          hipInitial: hipInitial,
          waistInitial: waistInitial,
          abdomenInitial: abdomenInitial,
          height: height,
          idClient: idClient,
        );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'weight_initial': weightInitial,
      'hip_initial': hipInitial,
      'waist_initial': waistInitial,
      'abdomen_initial': abdomenInitial,
      'height': height,
      'id_client': idClient,
    };
  }

  factory MeasurementsModel.fromMap(Map<String, dynamic> map) {
    return MeasurementsModel(
      weightInitial: map['weight_initial'] as double,
      hipInitial: map['hip_initial'] as double,
      waistInitial: map['waist_initial'] as double,
      abdomenInitial: map['abdomen_initial'] as double,
      height: map['height'] as double,
      idClient: map['id_client'] as int,
    );
  }
}
