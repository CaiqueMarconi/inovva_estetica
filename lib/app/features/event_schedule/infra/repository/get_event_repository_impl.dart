import 'package:innova_estetica/app/core/shared/exceptions/app_exception.dart';
import 'package:innova_estetica/app/features/event_schedule/domain/entities/event_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:innova_estetica/app/features/event_schedule/domain/repository/i_get_event_repository.dart';
import 'package:innova_estetica/app/features/event_schedule/infra/datasource/i_get_event_datasource.dart';

import '../../../../core/shared/exceptions/i_app_exception.dart';

class GetEventRepositoryImpl implements IGetEventRepository {
  final IGetEventDatasource _datasource;

  GetEventRepositoryImpl(this._datasource);
  @override
  Future<Either<IAppException, List<EventEntity>>> call() async {
    try {
      final result = await _datasource.getEvent();
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
