import 'package:innova_estetica/app/features/clients/domain/error/get_client_failure.dart';
import 'package:innova_estetica/app/features/clients/domain/entities/client_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:innova_estetica/app/features/clients/domain/repository/i_get_clients_repository.dart';
import 'package:innova_estetica/app/features/clients/infra/datasource/i_get_clients_datasource.dart';

class GetClientsRepositoryImpl implements IGetClientsRepository {
  final IGetClientsDatasource _datasource;

  GetClientsRepositoryImpl(this._datasource);

  @override
  Future<Either<IGetClientFailure, List<ClientEntity>>> call() async {
    try {
      final result = await _datasource.getClients();
      return Right(result);
    } on IGetClientFailure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(GetClientError('falha no repository $e'));
    }
  }
}
