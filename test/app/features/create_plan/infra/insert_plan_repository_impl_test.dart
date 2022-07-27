import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:innova_estetica/app/core/shared/exceptions/app_exception.dart';
import 'package:innova_estetica/app/core/shared/exceptions/i_app_exception.dart';
import 'package:innova_estetica/app/features/create_plan/infra/datasource/i_insert_plan_datasource.dart';
import 'package:innova_estetica/app/features/create_plan/infra/repository/insert_plan_repository_impl.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mock/create_plan_entity_mock.dart';

class _DatasourceMock extends Mock implements IInsertPlanDatasource {}

void main() {
  late IInsertPlanDatasource _datasource;
  late InsertPlanRepositoryImpl _repository;

  setUpAll(() {
    _datasource = _DatasourceMock();
    _repository = InsertPlanRepositoryImpl(_datasource);
  });

  test('deve retornar um int caso sucesso', () async {
    when(() => _datasource.insertPlan(createPlanEntityMock)).thenAnswer((invocation) async => 10);
    final result = await _repository.call(createPlanEntityMock);
    expect(result.fold(id, id), isA<int>());
  });
  test('deve retornar um erro caso falhar', () async {
    when(() => _datasource.insertPlan(createPlanEntityMock)).thenThrow((invocation) async => const AppException(
          message: 'falha no repository',
          stackTrace: StackTrace.empty,
        ));
    final result = await _repository.call(createPlanEntityMock);
    expect(result.fold(id, id), isA<IAppException>());
  });
}
