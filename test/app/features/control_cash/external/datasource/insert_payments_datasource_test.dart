import 'package:flutter_test/flutter_test.dart';
import 'package:innova_estetica/app/core/services/hasura/hasura_service.dart';
import 'package:innova_estetica/app/core/shared/exceptions/hasura_exception.dart';
import 'package:innova_estetica/app/features/control_cash/external/datasource/insert_payments_datasource.dart';
import 'package:innova_estetica/app/features/control_cash/external/docs_hasura/insert_value_mutation.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mock/control_cash_entity_mock.dart';

class _MockHasusa extends Mock implements HasuraService {}

void main() {
  late InsertPaymentsDatasource _datasource;
  late HasuraService _hasuraService;
  setUp(() {
    _hasuraService = _MockHasusa();
    _datasource = InsertPaymentsDatasource(_hasuraService);
  });

  final mockHasuraResponse = {
    "data": {
      "insert_control_cash_one": {"id": 4}
    }
  };
  test('insert payments datasource ...', () async {
    when(() => _hasuraService.mutation(docQuery: insertValueMutation, variables: any(named: 'variables')))
        .thenAnswer((invocation) async => mockHasuraResponse);
    final result = await _datasource.call(controlCashMock);
    expect(result, isA<int>());
    verify(() => _hasuraService.mutation(docQuery: insertValueMutation, variables: any(named: 'variables'))).called(1);
  });
  test('insert payments datasource Failure ...', () async {
    when(() => _hasuraService.mutation(docQuery: insertValueMutation, variables: any(named: 'variables')))
        .thenThrow(const HasuraAppException(message: 'failure Datasource'));
    final result = _datasource;
    expect(() async => await result.call(controlCashMock), throwsA(isA<Exception>()));
    verify(() => _hasuraService.mutation(docQuery: insertValueMutation, variables: any(named: 'variables'))).called(1);
  });
}
