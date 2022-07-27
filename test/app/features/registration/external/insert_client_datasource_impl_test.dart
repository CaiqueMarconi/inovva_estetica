import 'package:flutter_test/flutter_test.dart';
import 'package:innova_estetica/app/core/services/hasura/hasura_service.dart';
import 'package:innova_estetica/app/core/shared/exceptions/hasura_exception.dart';
import 'package:innova_estetica/app/features/registration/external/datasource/insert_client_datasource_impl.dart';
import 'package:innova_estetica/app/features/registration/external/docs_hasura/insert_client_mutation.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mock/client_data_entity_mock.dart';

class HasuraClientMock extends Mock implements HasuraService {}

void main() {
  final hasuraClient = HasuraClientMock();
  final datasource = InsertCLientDatasource(hasuraClient);

  final mockResultHasura = {
    "data": {
      "insert_clients_one": {"id": 5},
    }
  };

  setUpAll(() {
    registerFallbackValue(mockResultHasura);
    registerFallbackValue(clientDataEntityMock);
  });

  test('deve retornar uma mensagem de sucess', () async {
    when(() => hasuraClient.mutation(docQuery: insertClientMutation, variables: any(named: 'variables'))).thenAnswer(
      (invocation) async => mockResultHasura,
    );
    final result = await datasource.insertClient(clientDataEntityMock);
    expect(result, isA<int>());
    verify(() => hasuraClient.mutation(docQuery: insertClientMutation, variables: any(named: 'variables'))).called(1);
  });
  test('deve retornar uma mensagem de erro', () async {
    when(() => hasuraClient.mutation(docQuery: insertClientMutation, variables: any(named: 'variables'))).thenThrow(
      const HasuraAppException(message: 'falha no datasource'),
    );
    final result = datasource.insertClient;
    expect(() async => result(clientDataEntityMock), throwsA(isA<Exception>()));
    verify(() => hasuraClient.mutation(docQuery: insertClientMutation, variables: any(named: 'variables'))).called(1);
  });
}
