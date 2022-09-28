import 'package:dartz/dartz.dart';
import 'package:innova_estetica/app/features/event_schedule/domain/entities/event_entity.dart';
import 'package:innova_estetica/app/features/event_schedule/domain/repository/i_get_event_repository.dart';

import '../../../../core/shared/exceptions/i_app_exception.dart';

abstract class IGetEventUsecase {
  Future<Either<IAppException, List<EventEntity>>> call();
}

class GetEventUsecaseImpl implements IGetEventUsecase {
  final IGetEventRepository _repository;

  GetEventUsecaseImpl(this._repository);
  @override
  Future<Either<IAppException, List<EventEntity>>> call() async {
    final result = await _repository.call();
    return result;
  }
}
