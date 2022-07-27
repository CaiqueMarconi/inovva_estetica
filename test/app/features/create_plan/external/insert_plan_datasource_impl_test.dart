import 'package:flutter_test/flutter_test.dart';
import 'package:innova_estetica/app/core/services/hasura/hasura_service.dart';
import 'package:innova_estetica/app/core/shared/exceptions/hasura_exception.dart';
import 'package:innova_estetica/app/features/create_plan/external/datasource/insert_plan_datasource_impl.dart';
import 'package:innova_estetica/app/features/create_plan/external/docs_hasura/insert_plan_mutation.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mock/create_plan_entity_mock.dart';

class HasuraClientMock extends Mock implements HasuraService {}

void main() {
  final hasuraClient = HasuraClientMock();
  final datasource = InsertPlanDatasourceImpl(hasuraClient);

  final mockResultHasura = {
    "data": {
      "insert_packages_one": {"id": 1}
    }
  };

  setUpAll(() {
    registerFallbackValue(mockResultHasura);
    registerFallbackValue(createPlanEntityMock);
  });

  test('deve retornar um int caso sucess', () async {
    when(() => hasuraClient.mutation(docQuery: insertPlanMutation, variables: any(named: 'variables'))).thenAnswer(
      (invocation) async => mockResultHasura,
    );
    final result = await datasource.insertPlan(createPlanEntityMock);
    expect(result, isA<int>());
    verify(() => hasuraClient.mutation(docQuery: insertPlanMutation, variables: any(named: 'variables'))).called(1);
  });
  test('deve retornar um erro caso falhar', () async {
    when(() => hasuraClient.mutation(docQuery: insertPlanMutation, variables: any(named: 'variables'))).thenThrow(
      const HasuraAppException(message: 'falha no datasource'),
    );
    final result = datasource.insertPlan;
    expect(() async => result(createPlanEntityMock), throwsA(isA<Exception>()));
    verify(() => hasuraClient.mutation(docQuery: insertPlanMutation, variables: any(named: 'variables'))).called(1);
  });
}
