import 'package:innova_estetica/app/core/shared/exceptions/app_exception.dart';

class FirebaseAppException extends AppException {
  const FirebaseAppException({
    required String message,
    StackTrace? stackTrace,
  }) : super(message: message, stackTrace: stackTrace);
}
