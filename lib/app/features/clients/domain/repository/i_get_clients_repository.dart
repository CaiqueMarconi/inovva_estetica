import 'package:dartz/dartz.dart';
import 'package:innova_estetica/app/core/shared/exceptions/i_app_exception.dart';

import '../entities/client_entity.dart';

abstract class IGetClientsRepository {
  Future<Either<IAppException, List<ClientEntity>>> call();
}
