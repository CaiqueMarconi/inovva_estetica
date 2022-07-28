import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:innova_estetica/app/core/shared/exceptions/app_exception.dart';
import 'package:innova_estetica/app/features/create_plan/domain/entities/plan_entity.dart';
import 'package:innova_estetica/app/features/create_plan/external/model/plan_model.dart';
import 'package:innova_estetica/app/features/create_plan/infra/datasource/i_get_plans_datasource.dart';
import 'package:innova_estetica/app/features/create_plan/infra/repository/get_plans_repository_impl.dart';
import 'package:mocktail/mocktail.dart';

class _DatasourceMock extends Mock implements IGetPlansDatasource {}

void main() {
  final _datasource = _DatasourceMock();
  final _repository = GetPlansRepositoryImpl(_datasource);

  const _mock = PlanModel(
    namePlan: 'namePlan',
    description: 'description',
    qtdSections: 10,
  );

  test('deve retornar uma lista PlanEntity caso sucesso', () async {
    when(() => _datasource.getPlans()).thenAnswer((invocation) async => [_mock]);
    final result = await _repository.call();
    expect(result.fold(id, id), isA<List<PlanEntity>>());
  });
  test('deve retornar um erro caso falhar', () async {
    when(() => _datasource.getPlans()).thenThrow(
      (invocation) async => const AppException(
        message: 'falha no repository',
        stackTrace: StackTrace.empty,
      ),
    );
    final result = await _repository.call();
    expect(result.fold(id, id), isA<Exception>());
  });
}
