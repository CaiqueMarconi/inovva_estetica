import 'package:dartz/dartz.dart';
import 'package:innova_estetica/app/features/registration/domain/entities/client_data_entity.dart';
import 'package:innova_estetica/app/features/registration/domain/error/insert_client_failure.dart';

abstract class IInsertClientRepository {
  Future<Either<IInsertClientFailure, int>> call(ClientDataEntity params);
}
