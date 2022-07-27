import 'package:dartz/dartz.dart';
import 'package:innova_estetica/app/features/registration/domain/entities/adress_entity.dart';
import 'package:innova_estetica/app/features/registration/domain/error/insert_adress_failure.dart';

abstract class IInsertAdressRepository {
  Future<Either<IInsertAdressFailure, int>> call(AdressEntity params);
}
