import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:innova_estetica/app/features/event_schedule/domain/error/insert_event_failure.dart';
import 'package:innova_estetica/app/features/event_schedule/infra/datasource/i_insert_event_datasource.dart';
import 'package:innova_estetica/app/features/event_schedule/infra/repository/insert_event_repository_impl.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mock/param_event_entity_mock.dart';

class _DatasourceMock extends Mock implements IInsertEventDatasource {}

void main() {
  late IInsertEventDatasource _datasource;
  late InsertEventRepositoryImpl _repository;

  setUpAll(() {
    _datasource = _DatasourceMock();
    _repository = InsertEventRepositoryImpl(_datasource);
  });

  test('deve retornar um int caso sucesso', () async {
    when(() => _datasource.insertEvent(paramEventEntityMock)).thenAnswer((invocation) async => 10);
    final result = await _repository.call(paramEventEntityMock);
    expect(result.fold(id, id), isA<int>());
  });
  test('deve retornar um erro caso falhar', () async {
    when(() => _datasource.insertEvent(paramEventEntityMock)).thenThrow((invocation) async => InsertEventError('falha no usecase'));
    final result = await _repository.call(paramEventEntityMock);
    expect(result.fold(id, id), isA<Exception>());
  });
}
