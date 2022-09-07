import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:innova_estetica/app/core/shared/exceptions/app_exception.dart';
import 'package:innova_estetica/app/features/control_cash/domain/repository/i_insert_payments_repository.dart';
import 'package:innova_estetica/app/features/control_cash/domain/usecase/i_insert_payments_usecase.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mock/control_cash_entity_mock.dart';

class _MockRepository extends Mock implements IInsertPaymentsRepository {}

void main() {
  late IInsertPaymentsRepository _repository;
  late InsertPaymentsUsecase _usecase;

  setUp(() {
    _repository = _MockRepository();
    _usecase = InsertPaymentsUsecase(_repository);
  });

  test('i insert payments usecase ...', () async {
    when(() => _repository.call(controlCashMock)).thenAnswer((invocation) async => const Right(0));
    final result = await _usecase.call(controlCashMock);
    expect(result.fold(id, id), isA<int>());
  });
  test('i insert payments usecase Failure...', () async {
    when(() => _repository.call(controlCashMock)).thenAnswer(
      (invocation) async => const Left(
        AppException(
          message: 'failure',
          stackTrace: StackTrace.empty,
        ),
      ),
    );
    final result = await _usecase.call(controlCashMock);
    expect(result.fold(id, id), isA<Exception>());
  });
}
