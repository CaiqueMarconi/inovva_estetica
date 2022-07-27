import 'package:dartz/dartz.dart';

import '../entities/client_entity.dart';
import '../error/get_client_failure.dart';

abstract class IGetClientsRepository {
  Future<Either<IGetClientFailure, List<ClientEntity>>> call();
}
