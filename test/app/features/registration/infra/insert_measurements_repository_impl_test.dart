import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:innova_estetica/app/core/shared/exceptions/app_exception.dart';
import 'package:innova_estetica/app/features/registration/infra/datasource/i_insert_measurements_datasource.dart';
import 'package:innova_estetica/app/features/registration/infra/repository/insert_measurements_impl.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mock/measurements_entity_mock.dart';

class _DatasourceMock extends Mock implements IInsertMeasurementsDatasource {}

void main() {
  late IInsertMeasurementsDatasource _datasource;
  late InsertMeasurementsRepositoryImpl _repository;

  setUpAll(() {
    _datasource = _DatasourceMock();
    _repository = InsertMeasurementsRepositoryImpl(_datasource);
  });

  test('deve retornar um int caso sucesso', () async {
    when(() => _datasource.insertMeasurements(measurementsEntityMock)).thenAnswer((invocation) async => 10);
    final result = await _repository.call(measurementsEntityMock);
    expect(result.fold(id, id), isA<int>());
  });
  test('deve retornar um erro caso falhar', () async {
    when(() => _datasource.insertMeasurements(measurementsEntityMock)).thenThrow(
      (invocation) async => const AppException(
        message: 'falha no repository',
        stackTrace: StackTrace.empty,
      ),
    );
    final result = await _repository.call(measurementsEntityMock);
    expect(result.fold(id, id), isA<Exception>());
  });
}
