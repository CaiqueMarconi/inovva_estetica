abstract class IInsertClientFailure implements Exception {}

class InsertClientError implements IInsertClientFailure {
  final String messageError;

  InsertClientError(this.messageError);
}
