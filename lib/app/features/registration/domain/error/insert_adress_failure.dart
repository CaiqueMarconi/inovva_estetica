abstract class IInsertAdressFailure implements Exception {}

class InsertAdressError implements IInsertAdressFailure {
  final String messageError;

  InsertAdressError(this.messageError);
}
