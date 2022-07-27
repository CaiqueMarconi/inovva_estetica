import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:innova_estetica/app/core/shared/exceptions/app_exception.dart';
import 'package:innova_estetica/app/features/registration/domain/repository/i_insert_measurements_repository.dart';
import 'package:innova_estetica/app/features/registration/domain/usecase/i_insert_measurements_usecase.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mock/measurements_entity_mock.dart';

class _RepositoryMock extends Mock implements IInsertMeasurementsRepository {}

void main() {
  late IInsertMeasurementsRepository _repository;
  late InsertMeasurementsUsecaseImpl _usecase;

  setUpAll(() {
    _repository = _RepositoryMock();
    _usecase = InsertMeasurementsUsecaseImpl(_repository);
  });

  test('deve retornar um int caso sucesso', () async {
    when(() => _repository.call(measurementsEntityMock)).thenAnswer((invocation) async => const Right(10));
    final result = await _usecase.call(measurementsEntityMock);
    expect(result.fold(id, id), isA<int>());
  });
  test('deve retornar um erro caso falhar', () async {
    when(() => _repository.call(measurementsEntityMock)).thenAnswer(
      (invocation) async => const Left(
        AppException(
          message: 'falha no usecase',
          stackTrace: StackTrace.empty,
        ),
      ),
    );
    final result = await _usecase.call(measurementsEntityMock);
    expect(result.fold(id, id), isA<Exception>());
  });
}
