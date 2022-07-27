import 'package:dartz/dartz.dart';

import '../../domain/entities/param_event_entity.dart';
import '../../domain/error/insert_event_failure.dart';
import '../../domain/repository/i_insert_event_repository.dart';
import '../datasource/i_insert_event_datasource.dart';

class InsertEventRepositoryImpl implements IInsertEventRepository {
  final IInsertEventDatasource _datasource;

  InsertEventRepositoryImpl(this._datasource);
  @override
  Future<Either<IInsertEventFailure, int>> call(ParamEventEntity params) async {
    try {
      final result = await _datasource.insertEvent(params);
      return Right(result);
    } on IInsertEventFailure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(InsertEventError('falha no repository $e'));
    }
  }
}
