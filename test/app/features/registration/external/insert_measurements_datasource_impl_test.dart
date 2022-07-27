import 'package:flutter_test/flutter_test.dart';
import 'package:innova_estetica/app/core/services/hasura/hasura_service.dart';
import 'package:innova_estetica/app/core/shared/exceptions/hasura_exception.dart';
import 'package:innova_estetica/app/features/registration/external/datasource/insert_measurements_datasource_impl.dart';
import 'package:innova_estetica/app/features/registration/external/docs_hasura/insert_measurements_mutation.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mock/measurements_entity_mock.dart';

class HasuraClientMock extends Mock implements HasuraService {}

void main() {
  final hasuraClient = HasuraClientMock();
  final datasource = InsertMeasurementsDatasourceImpl(hasuraClient);

  final mockResultHasura = {
    "data": {
      "insert_measurements_one": {"id": 2}
    }
  };

  setUpAll(() {
    registerFallbackValue(mockResultHasura);
    registerFallbackValue(measurementsEntityMock);
  });

  test('deve retornar um int caso sucess', () async {
    when(() => hasuraClient.mutation(docQuery: insertMeasurementsMutation, variables: any(named: 'variables'))).thenAnswer(
      (invocation) async => mockResultHasura,
    );
    final result = await datasource.insertMeasurements(measurementsEntityMock);
    expect(result, isA<int>());
    verify(() => hasuraClient.mutation(docQuery: insertMeasurementsMutation, variables: any(named: 'variables'))).called(1);
  });
  test('deve retornar um erro caso falhar', () async {
    when(() => hasuraClient.mutation(docQuery: insertMeasurementsMutation, variables: any(named: 'variables'))).thenThrow(
      const HasuraAppException(message: 'falha no datasource'),
    );
    final result = datasource.insertMeasurements;
    expect(() async => result(measurementsEntityMock), throwsA(isA<Exception>()));
    verify(() => hasuraClient.mutation(docQuery: insertMeasurementsMutation, variables: any(named: 'variables'))).called(1);
  });
}
