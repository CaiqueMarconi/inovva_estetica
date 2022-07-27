import 'package:dartz/dartz.dart';
import 'package:innova_estetica/app/features/event_schedule/domain/entities/event_entity.dart';
import 'package:innova_estetica/app/features/event_schedule/domain/error/get_event_failure.dart';
import 'package:innova_estetica/app/features/event_schedule/domain/repository/i_get_event_repository.dart';

abstract class IGetEventUsecase {
  Future<Either<IGetEventFailure, EventEntity>> call(int idClient);
}

class GetEventUsecaseImpl implements IGetEventUsecase {
  final IGetEventRepository _repository;

  GetEventUsecaseImpl(this._repository);
  @override
  Future<Either<IGetEventFailure, EventEntity>> call(int idClient) async {
    final result = await _repository.call(idClient);
    return result;
  }
}
