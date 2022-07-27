import 'package:dartz/dartz.dart';
import 'package:innova_estetica/app/features/registration/domain/entities/client_data_entity.dart';
import 'package:innova_estetica/app/features/registration/domain/error/insert_client_failure.dart';
import 'package:innova_estetica/app/features/registration/domain/repository/i_insert_client_repository.dart';
import 'package:innova_estetica/app/features/registration/infra/datasource/i_insert_client_datasource.dart';

class InsertClientRepositoryImpl implements IInsertClientRepository {
  final IInsertClientDatasource _datasource;

  InsertClientRepositoryImpl(this._datasource);
  @override
  Future<Either<IInsertClientFailure, int>> call(ClientDataEntity params) async {
    try {
      final result = await _datasource.insertClient(params);
      return Right(result);
    } on IInsertClientFailure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(InsertClientError('falha no repository $e'));
    }
  }
}
