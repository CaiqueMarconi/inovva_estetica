import 'package:dartz/dartz.dart';

import '../../../../core/shared/exceptions/i_app_exception.dart';
import '../entities/event_entity.dart';

abstract class IGetEventRepository {
  Future<Either<IAppException, List<EventEntity>>> call();
}
