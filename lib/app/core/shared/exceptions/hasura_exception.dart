import 'app_exception.dart';

class HasuraAppException extends AppException {
  const HasuraAppException({
    required String message,
    StackTrace? stackTrace,
  }) : super(message: message, stackTrace: stackTrace);
}
