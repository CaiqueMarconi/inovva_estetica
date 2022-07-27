import 'package:flutter_test/flutter_test.dart';
import 'package:innova_estetica/app/core/services/hasura/hasura_service.dart';
import 'package:innova_estetica/app/core/shared/exceptions/hasura_exception.dart';
import 'package:innova_estetica/app/features/event_schedule/external/datasource/insert_event_datasource_impl.dart';
import 'package:innova_estetica/app/features/event_schedule/external/docs_hasura/insert_event_mutation.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mock/param_event_entity_mock.dart';

class HasuraClientMock extends Mock implements HasuraService {}

void main() {
  final hasuraClient = HasuraClientMock();
  final datasource = InsertEventDatasourceImpl(hasuraClient);

  final mockResultHasura = {
    "data": {
      "insert_schedule_event_one": {"id": 2}
    }
  };

  setUpAll(() {
    registerFallbackValue(mockResultHasura);
    registerFallbackValue(paramEventEntityMock);
  });

  test('deve retornar um int caso sucess', () async {
    when(() => hasuraClient.mutation(docQuery: insertEventMutation, variables: any(named: 'variables'))).thenAnswer(
      (invocation) async => mockResultHasura,
    );
    final result = await datasource.insertEvent(paramEventEntityMock);
    expect(result, isA<int>());
    verify(() => hasuraClient.mutation(docQuery: insertEventMutation, variables: any(named: 'variables'))).called(1);
  });
  test('deve retornar um erro caso falhar', () async {
    when(() => hasuraClient.mutation(docQuery: insertEventMutation, variables: any(named: 'variables'))).thenThrow(
      const HasuraAppException(message: 'falha no datasource'),
    );
    final result = datasource.insertEvent;
    expect(() async => result(paramEventEntityMock), throwsA(isA<Exception>()));
    verify(() => hasuraClient.mutation(docQuery: insertEventMutation, variables: any(named: 'variables'))).called(1);
  });
}
