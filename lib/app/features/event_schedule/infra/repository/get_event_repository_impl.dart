import 'package:innova_estetica/app/features/event_schedule/domain/error/get_event_failure.dart';
import 'package:innova_estetica/app/features/event_schedule/domain/entities/event_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:innova_estetica/app/features/event_schedule/domain/repository/i_get_event_repository.dart';
import 'package:innova_estetica/app/features/event_schedule/infra/datasource/i_get_event_datasource.dart';

class GetEventRepositoryImpl implements IGetEventRepository {
  final IGetEventDatasource _datasource;

  GetEventRepositoryImpl(this._datasource);
  @override
  Future<Either<IGetEventFailure, EventEntity>> call(int idClient) async {
    try {
      final result = await _datasource.getEvent(idClient);
      return Right(result);
    } on IGetEventFailure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(GetEventError('falha no repository $e'));
    }
  }
}
