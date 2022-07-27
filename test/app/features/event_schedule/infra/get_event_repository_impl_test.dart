import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:innova_estetica/app/features/event_schedule/domain/entities/event_entity.dart';
import 'package:innova_estetica/app/features/event_schedule/domain/error/get_event_failure.dart';
import 'package:innova_estetica/app/features/event_schedule/external/model/event_model.dart';
import 'package:innova_estetica/app/features/event_schedule/infra/datasource/i_get_event_datasource.dart';
import 'package:innova_estetica/app/features/event_schedule/infra/repository/get_event_repository_impl.dart';
import 'package:mocktail/mocktail.dart';

class _DatasourceMock extends Mock implements IGetEventDatasource {}

void main() {
  final _datasource = _DatasourceMock();
  final _repository = GetEventRepositoryImpl(_datasource);

  final _mock = EventModel(
    idClient: 8,
    timeInitial: DateTime.parse('2022-01-01'),
    timeFinal: DateTime.parse('2022-01-01'),
    description: 'description',
    name: 'name',
  );

  test('deve retornar um EventEntity caso sucesso', () async {
    when(() => _datasource.getEvent(8)).thenAnswer((invocation) async => _mock);
    final result = await _repository.call(8);
    expect(result.fold(id, id), isA<EventEntity>());
  });
  test('deve retornar um erro caso falhar', () async {
    when(() => _datasource.getEvent(8)).thenThrow((invocation) async => GetEventError('falha no usecase'));
    final result = await _repository.call(8);
    expect(result.fold(id, id), isA<Exception>());
  });
}
