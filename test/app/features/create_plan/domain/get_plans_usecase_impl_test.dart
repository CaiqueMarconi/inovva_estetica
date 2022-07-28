import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:innova_estetica/app/core/shared/exceptions/app_exception.dart';
import 'package:innova_estetica/app/features/create_plan/domain/entities/plan_entity.dart';
import 'package:innova_estetica/app/features/create_plan/domain/repository/i_get_plans_repository.dart';
import 'package:innova_estetica/app/features/create_plan/domain/usecase/i_get_plans_usecase.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mock/plan_entity_mock.dart';

class _RepositoryMock extends Mock implements IGetPlansRepository {}

void main() {
  final _repository = _RepositoryMock();
  final _usecase = GetPlansUsecaseImpl(_repository);

  test('deve retornar uma list PlanEntity caso sucesso', () async {
    when(() => _repository.call()).thenAnswer((invocation) async => const Right([planEntityMock]));
    final result = await _usecase.call();
    expect(result.fold(id, id), isA<List<PlanEntity>>());
  });
  test('deve retornar um erro caso falhar', () async {
    when(() => _repository.call()).thenAnswer(
      (invocation) async => const Left(
        AppException(
          message: 'falha no usecase',
          stackTrace: StackTrace.empty,
        ),
      ),
    );
    final result = await _usecase.call();
    expect(result.fold(id, id), isA<Exception>());
  });
}
