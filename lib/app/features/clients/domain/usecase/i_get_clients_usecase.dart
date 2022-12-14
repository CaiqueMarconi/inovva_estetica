import 'package:dartz/dartz.dart';
import 'package:innova_estetica/app/features/clients/domain/entities/client_entity.dart';

import 'package:innova_estetica/app/features/clients/domain/repository/i_get_clients_repository.dart';

import '../../../../core/shared/exceptions/i_app_exception.dart';

abstract class IGetClientsUsecase {
  Future<Either<IAppException, List<ClientEntity>>> call();
}

class GetClientsUsecaseImpl implements IGetClientsUsecase {
  final IGetClientsRepository _repository;

  GetClientsUsecaseImpl(this._repository);

  @override
  Future<Either<IAppException, List<ClientEntity>>> call() async {
    final result = await _repository.call();
    return result;
  }
}
