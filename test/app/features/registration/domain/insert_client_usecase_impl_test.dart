import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:innova_estetica/app/features/registration/domain/error/insert_client_failure.dart';
import 'package:innova_estetica/app/features/registration/domain/repository/i_insert_client_repository.dart';
import 'package:innova_estetica/app/features/registration/domain/usecase/i_insert_client_usecase.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mock/client_data_entity_mock.dart';

class _RepositoryMock extends Mock implements IInsertClientRepository {}

void main() {
  late IInsertClientRepository _repository;
  late InsertClientUsecaseImpl _usecase;

  setUpAll(() {
    _repository = _RepositoryMock();
    _usecase = InsertClientUsecaseImpl(_repository);
  });

  test('deve retornar um int caso sucesso', () async {
    when(() => _repository.call(clientDataEntityMock))
        .thenAnswer((invocation) async => const Right(10));
    final result = await _usecase.call(clientDataEntityMock);
    expect(result.fold(id, id), isA<int>());
  });
  test('deve retornar um erro caso falhar', () async {
    when(() => _repository.call(clientDataEntityMock)).thenAnswer(
        (invocation) async => Left(InsertClientError('falha no usecase')));
    final result = await _usecase.call(clientDataEntityMock);
    expect(result.fold(id, id), isA<Exception>());
  });
}
