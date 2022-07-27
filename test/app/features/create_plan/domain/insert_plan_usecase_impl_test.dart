import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:innova_estetica/app/core/shared/exceptions/app_exception.dart';
import 'package:innova_estetica/app/features/create_plan/domain/repository/i_insert_plan_repository.dart';
import 'package:innova_estetica/app/features/create_plan/domain/usecase/i_insert_plan_usecase.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mock/create_plan_entity_mock.dart';

class _RepositoryMock extends Mock implements IInsertPlanRepository {}

void main() {
  late IInsertPlanRepository _repository;
  late InsertPlanUsecaseImpl _usecase;

  setUpAll(() {
    _repository = _RepositoryMock();
    _usecase = InsertPlanUsecaseImpl(_repository);
  });

  test('deve retornar um int caso sucesso', () async {
    when(() => _repository.call(createPlanEntityMock)).thenAnswer((invocation) async => const Right(10));
    final result = await _usecase.call(createPlanEntityMock);
    expect(result.fold(id, id), isA<int>());
  });
  test('deve retornar um erro caso falhar', () async {
    when(() => _repository.call(createPlanEntityMock)).thenAnswer(
      (invocation) async => const Left(
        AppException(
          message: 'falha no usecase',
          stackTrace: StackTrace.empty,
        ),
      ),
    );
    final result = await _usecase.call(createPlanEntityMock);
    expect(result.fold(id, id), isA<Exception>());
  });
}
