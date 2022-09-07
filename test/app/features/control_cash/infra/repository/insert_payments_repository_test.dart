import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:innova_estetica/app/core/shared/exceptions/app_exception.dart';
import 'package:innova_estetica/app/features/control_cash/infra/datasource/i_insert_payments_datasource.dart';
import 'package:innova_estetica/app/features/control_cash/infra/repository/insert_payments_repository.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mock/control_cash_entity_mock.dart';

class _MockDatasource extends Mock implements IInsertPaymentsDatasource {}

void main() {
  late IInsertPaymentsDatasource _datasource;
  late InsertPaymentsRepository _repository;

  setUp(() {
    _datasource = _MockDatasource();
    _repository = InsertPaymentsRepository(_datasource);
  });
  test('insert payments repository ...', () async {
    when(() => _datasource.call(controlCashMock)).thenAnswer((invocation) async => 0);
    final result = await _repository.call(controlCashMock);
    expect(result.fold(id, id), isA<int>());
  });
  test('insert payments repository Failure...', () async {
    when(() => _datasource.call(controlCashMock)).thenThrow(
      (invocation) async => const AppException(
        message: '',
        stackTrace: StackTrace.empty,
      ),
    );
    final result = await _repository.call(controlCashMock);
    expect(result.fold(id, id), isA<Exception>());
  });
}
