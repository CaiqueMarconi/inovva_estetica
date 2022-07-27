import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:innova_estetica/app/features/clients/domain/entities/client_entity.dart';
import 'package:innova_estetica/app/features/clients/domain/error/get_client_failure.dart';
import 'package:innova_estetica/app/features/clients/domain/repository/i_get_clients_repository.dart';
import 'package:innova_estetica/app/features/clients/domain/usecase/i_get_clients_usecase.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mock/client_entity_mock.dart';

class _RepositoryMock extends Mock implements IGetClientsRepository {}

void main() {
  final _repository = _RepositoryMock();
  final _usecase = GetClientsUsecaseImpl(_repository);

  test('deve retornar um ClientEntity caso sucesso', () async {
    when(() => _repository.call()).thenAnswer((invocation) async => Right([clientEntityMock]));
    final result = await _usecase.call();
    expect(result.fold(id, id), isA<List<ClientEntity>>());
  });
  test('deve retornar um erro caso falhar', () async {
    when(() => _repository.call()).thenAnswer(
      (invocation) async => Left(
        GetClientError('falha no usecase'),
      ),
    );
    final result = await _usecase.call();
    expect(result.fold(id, id), isA<Exception>());
  });
}
