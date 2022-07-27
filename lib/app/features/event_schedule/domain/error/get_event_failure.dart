abstract class IGetEventFailure implements Exception {}

class GetEventError implements IGetEventFailure {
  final String messageError;

  GetEventError(this.messageError);
}
