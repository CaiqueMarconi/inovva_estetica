import 'package:dartz/dartz.dart';
import 'package:innova_estetica/app/features/event_schedule/domain/entities/param_event_entity.dart';
import 'package:innova_estetica/app/features/event_schedule/domain/error/insert_event_failure.dart';

import '../repository/i_insert_event_repository.dart';

abstract class IInsertEventUsecase {
  Future<Either<IInsertEventFailure, int>> call(ParamEventEntity params);
}

class InsertEventUsecaseImpl implements IInsertEventUsecase {
  final IInsertEventRepository _repository;

  InsertEventUsecaseImpl(this._repository);
  @override
  Future<Either<IInsertEventFailure, int>> call(ParamEventEntity params) async {
    final result = await _repository.call(params);
    return result;
  }
}
