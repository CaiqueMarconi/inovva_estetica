abstract class IGetClientFailure implements Exception {}

class GetClientError implements IGetClientFailure {
  final String messageError;

  GetClientError(this.messageError);
}
