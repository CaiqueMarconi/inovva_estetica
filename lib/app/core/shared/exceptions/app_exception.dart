import 'package:flutter/cupertino.dart';

import 'i_app_exception.dart';

@immutable
class AppException extends IAppException {
  const AppException({
    required String message,
    required StackTrace? stackTrace,
  }) : super(message: message, stackTrace: stackTrace);
}
