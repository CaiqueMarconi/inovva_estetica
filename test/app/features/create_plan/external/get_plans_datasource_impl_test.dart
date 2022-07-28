import 'package:flutter_test/flutter_test.dart';
import 'package:innova_estetica/app/core/services/hasura/hasura_service.dart';
import 'package:innova_estetica/app/core/shared/exceptions/hasura_exception.dart';
import 'package:innova_estetica/app/features/create_plan/domain/entities/plan_entity.dart';
import 'package:innova_estetica/app/features/create_plan/external/datasource/get_plans_datasource_impl.dart';
import 'package:innova_estetica/app/features/create_plan/external/docs_hasura/get_plans_query.dart';
import 'package:mocktail/mocktail.dart';

class HasuraClientMock extends Mock implements HasuraService {}

void main() {
  final hasuraClient = HasuraClientMock();
  final datasource = GetPlansDatasourceImpl(hasuraClient);

  final mockResultHasura = {
    "data": {
      "packages": [
        {"name": "teste", "description": "teste", "qtd_sections": 10}
      ]
    }
  };

  test('deve retornar uma Lista de PlanEntity caso sucess', () async {
    when(() => hasuraClient.query(docQuery: getPlansQuery)).thenAnswer(
      (invocation) async => mockResultHasura,
    );
    final result = await datasource.getPlans();
    expect(result, isA<List<PlanEntity>>());
    verify(() => hasuraClient.query(docQuery: getPlansQuery)).called(1);
  });
  test('deve retornar um erro caso falhar', () async {
    when(() => hasuraClient.query(docQuery: getPlansQuery)).thenThrow(
      const HasuraAppException(message: 'falha no datasource'),
    );
    final result = datasource.getPlans;
    expect(() async => result(), throwsA(isA<Exception>()));
    verify(() => hasuraClient.query(docQuery: getPlansQuery)).called(1);
  });
}
