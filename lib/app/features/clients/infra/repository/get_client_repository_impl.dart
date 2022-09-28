import 'package:innova_estetica/app/core/shared/exceptions/app_exception.dart';
import 'package:innova_estetica/app/features/clients/domain/entities/client_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:innova_estetica/app/features/clients/domain/repository/i_get_clients_repository.dart';
import 'package:innova_estetica/app/features/clients/infra/datasource/i_get_clients_datasource.dart';

import '../../../../core/shared/exceptions/i_app_exception.dart';

class GetClientsRepositoryImpl implements IGetClientsRepository {
  final IGetClientsDatasource _datasource;

  GetClientsRepositoryImpl(this._datasource);

  @override
  Future<Either<IAppException, List<ClientEntity>>> call() async {
    try {
      final result = await _datasource.getClients();
      return Right(result);
    } on IAppException catch (e) {
      return Left(e);
    } catch (e, s) {
      return Left(
        AppException(message: e.toString(), stackTrace: s),
      );
    }
  }
}
