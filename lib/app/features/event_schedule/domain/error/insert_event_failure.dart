abstract class IInsertEventFailure implements Exception {}

class InsertEventError implements IInsertEventFailure {
  final String messageError;

  InsertEventError(this.messageError);
}
