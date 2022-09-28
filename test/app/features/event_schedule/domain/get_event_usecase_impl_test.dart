import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:innova_estetica/app/core/shared/exceptions/app_exception.dart';
import 'package:innova_estetica/app/features/event_schedule/domain/entities/event_entity.dart';
import 'package:innova_estetica/app/features/event_schedule/domain/repository/i_get_event_repository.dart';
import 'package:innova_estetica/app/features/event_schedule/domain/usecase/i_get_event_usecase.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mock/event_entity_mock.dart';

class _RepositoryMock extends Mock implements IGetEventRepository {}

void main() {
  final _repository = _RepositoryMock();
  final _usecase = GetEventUsecaseImpl(_repository);

  test('deve retornar um EventEntity caso sucesso', () async {
    when(() => _repository.call()).thenAnswer((invocation) async => Right([eventEntityMock]));
    final result = await _usecase.call();
    expect(result.fold(id, id), isA<List<EventEntity>>());
  });
  test('deve retornar um erro caso falhar', () async {
    when(() => _repository.call()).thenAnswer(
      (invocation) async => const Left(
        AppException(message: 'falha no repository', stackTrace: null),
      ),
    );
    final result = await _usecase.call();
    expect(result.fold(id, id), isA<Exception>());
  });
}
