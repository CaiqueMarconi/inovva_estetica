import 'package:flutter_test/flutter_test.dart';
import 'package:innova_estetica/app/core/services/hasura/hasura_service.dart';
import 'package:innova_estetica/app/core/shared/exceptions/hasura_exception.dart';
import 'package:innova_estetica/app/features/registration/external/datasource/insert_adress_datasource_impl.dart';
import 'package:innova_estetica/app/features/registration/external/docs_hasura/insert_adress_mutation.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mock/adress_entity_mock.dart';

class HasuraClientMock extends Mock implements HasuraService {}

void main() {
  final hasuraClient = HasuraClientMock();
  final datasource = InsertAdressDatasourceImpl(hasuraClient);

  final mockResultHasura = {
    "data": {
      "insert_adress_one": {"id": 2}
    }
  };

  setUpAll(() {
    registerFallbackValue(mockResultHasura);
    registerFallbackValue(adressEntityMock);
  });

  test('deve retornar um int caso sucess', () async {
    when(() => hasuraClient.mutation(docQuery: insertAdressMutation, variables: any(named: 'variables'))).thenAnswer(
      (invocation) async => mockResultHasura,
    );
    final result = await datasource.insertAdress(adressEntityMock);
    expect(result, isA<int>());
    verify(() => hasuraClient.mutation(docQuery: insertAdressMutation, variables: any(named: 'variables'))).called(1);
  });
  test('deve retornar um erro caso falhar', () async {
    when(() => hasuraClient.mutation(docQuery: insertAdressMutation, variables: any(named: 'variables'))).thenThrow(
      const HasuraAppException(message: 'falha no datasource'),
    );
    final result = datasource.insertAdress;
    expect(() async => result(adressEntityMock), throwsA(isA<Exception>()));
    verify(() => hasuraClient.mutation(docQuery: insertAdressMutation, variables: any(named: 'variables'))).called(1);
  });
}
