import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:innova_estetica/app/features/registration/domain/error/insert_client_failure.dart';
import 'package:innova_estetica/app/features/registration/infra/datasource/i_insert_client_datasource.dart';
import 'package:innova_estetica/app/features/registration/infra/repository/insert_client_repository_impl.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mock/client_data_entity_mock.dart';

class _DatasourceMock extends Mock implements IInsertClientDatasource {}

void main() {
  late IInsertClientDatasource _datasource;
  late InsertClientRepositoryImpl _repository;

  setUpAll(() {
    _datasource = _DatasourceMock();
    _repository = InsertClientRepositoryImpl(_datasource);
  });

  test('deve retornar um int caso sucesso', () async {
    when(() => _datasource.insertClient(clientDataEntityMock))
        .thenAnswer((invocation) async => 10);
    final result = await _repository.call(clientDataEntityMock);
    expect(result.fold(id, id), isA<int>());
  });
  test('deve retornar um erro caso falhar', () async {
    when(() => _datasource.insertClient(clientDataEntityMock))
        .thenThrow((invocation) async => InsertClientError('falha no usecase'));
    final result = await _repository.call(clientDataEntityMock);
    expect(result.fold(id, id), isA<Exception>());
  });
}
