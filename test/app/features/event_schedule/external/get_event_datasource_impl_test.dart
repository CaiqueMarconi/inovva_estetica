import 'package:flutter_test/flutter_test.dart';
import 'package:innova_estetica/app/core/services/hasura/hasura_service.dart';
import 'package:innova_estetica/app/core/shared/exceptions/hasura_exception.dart';
import 'package:innova_estetica/app/features/event_schedule/external/datasource/get_event_datasource_impl.dart';
import 'package:innova_estetica/app/features/event_schedule/external/docs_hasura/get_event_by_id_query.dart';
import 'package:innova_estetica/app/features/event_schedule/external/model/event_model.dart';
import 'package:mocktail/mocktail.dart';

class HasuraClientMock extends Mock implements HasuraService {}

void main() {
  final hasuraClient = HasuraClientMock();
  final datasource = GetEventDatasourceImpl(hasuraClient);

  final mockResultHasura = {
    "data": {
      "schedule_event": [
        {
          "id_client": 8,
          "time_initial": "2022-01-01",
          "time_final": "2022-02-01",
          "description": "teste",
          "clients": {"name": "caique teste 0"}
        },
      ],
    },
  };

  test('deve retornar um EventEntity caso sucess', () async {
    when(() => hasuraClient.query(docQuery: getEventByIdQuery, variables: any(named: 'variables'))).thenAnswer(
      (invocation) async => mockResultHasura,
    );
    final result = await datasource.getEvent();
    expect(result, isA<List<EventModel>>());
    verify(() => hasuraClient.query(docQuery: getEventByIdQuery, variables: any(named: 'variables'))).called(1);
  });
  test('deve retornar um erro caso falhar', () async {
    when(() => hasuraClient.query(docQuery: getEventByIdQuery, variables: any(named: 'variables'))).thenThrow(
      const HasuraAppException(message: 'falha no datasource'),
    );
    final result = datasource.getEvent;
    expect(() async => result(), throwsA(isA<Exception>()));
    verify(() => hasuraClient.query(docQuery: getEventByIdQuery, variables: any(named: 'variables'))).called(1);
  });
}
