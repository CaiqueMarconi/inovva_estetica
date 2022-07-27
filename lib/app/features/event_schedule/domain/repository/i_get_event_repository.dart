import 'package:dartz/dartz.dart';

import '../entities/event_entity.dart';
import '../error/get_event_failure.dart';

abstract class IGetEventRepository {
  Future<Either<IGetEventFailure, EventEntity>> call(int idClient);
}
