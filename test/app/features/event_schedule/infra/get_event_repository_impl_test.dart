import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:innova_estetica/app/core/shared/exceptions/app_exception.dart';
import 'package:innova_estetica/app/features/event_schedule/domain/entities/event_entity.dart';
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
    idbeautician: 2,
  );

  test('deve retornar um EventEntity caso sucesso', () async {
    when(() => _datasource.getEvent()).thenAnswer((invocation) async => [_mock]);
    final result = await _repository.call();
    expect(result.fold(id, id), isA<List<EventEntity>>());
  });
  test('deve retornar um erro caso falhar', () async {
    when(() => _datasource.getEvent()).thenThrow((invocation) async => const AppException(
          message: 'message',
          stackTrace: null,
        ));
    final result = await _repository.call();
    expect(result.fold(id, id), isA<Exception>());
  });
}
