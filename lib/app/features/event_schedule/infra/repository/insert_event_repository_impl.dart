import 'package:dartz/dartz.dart';
import 'package:innova_estetica/app/core/shared/exceptions/app_exception.dart';

import '../../../../core/shared/exceptions/i_app_exception.dart';
import '../../domain/entities/param_event_entity.dart';
import '../../domain/repository/i_insert_event_repository.dart';
import '../datasource/i_insert_event_datasource.dart';

class InsertEventRepositoryImpl implements IInsertEventRepository {
  final IInsertEventDatasource _datasource;

  InsertEventRepositoryImpl(this._datasource);
  @override
  Future<Either<IAppException, int>> call(ParamEventEntity params) async {
    try {
      final result = await _datasource.insertEvent(params);
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
