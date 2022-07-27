import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:innova_estetica/app/features/event_schedule/domain/error/insert_event_failure.dart';
import 'package:innova_estetica/app/features/event_schedule/domain/repository/i_insert_event_repository.dart';
import 'package:innova_estetica/app/features/event_schedule/domain/usecase/i_insert_event_usecase.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mock/param_event_entity_mock.dart';

class _RepositoryMock extends Mock implements IInsertEventRepository {}

void main() {
  late IInsertEventRepository _repository;
  late InsertEventUsecaseImpl _usecase;

  setUpAll(() {
    _repository = _RepositoryMock();
    _usecase = InsertEventUsecaseImpl(_repository);
  });

  test('deve retornar um int caso sucesso', () async {
    when(() => _repository.call(paramEventEntityMock)).thenAnswer((invocation) async => const Right(10));
    final result = await _usecase.call(paramEventEntityMock);
    expect(result.fold(id, id), isA<int>());
  });
  test('deve retornar um erro caso falhar', () async {
    when(() => _repository.call(paramEventEntityMock)).thenAnswer(
      (invocation) async => Left(
        InsertEventError('falha no usecase'),
      ),
    );
    final result = await _usecase.call(paramEventEntityMock);
    expect(result.fold(id, id), isA<Exception>());
  });
}
