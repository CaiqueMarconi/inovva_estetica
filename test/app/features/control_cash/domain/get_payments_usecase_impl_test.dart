import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:innova_estetica/app/core/shared/exceptions/app_exception.dart';
import 'package:innova_estetica/app/features/control_cash/domain/entity/payment_entity.dart';
import 'package:innova_estetica/app/features/control_cash/domain/repository/i_get_payments_repository.dart';
import 'package:innova_estetica/app/features/control_cash/domain/usecase/i_get_payments_usecase.dart';

import 'package:mocktail/mocktail.dart';

import '../../../mock/payment_entity_mock.dart';

class _RepositoryMock extends Mock implements IGetPaymentsRepository {}

void main() {
  final _repository = _RepositoryMock();
  final _usecase = GetPaymentsUsecaseImpl(_repository);

  test('deve retornar um lista PaymentEntity caso sucesso', () async {
    when(() => _repository.call()).thenAnswer((invocation) async => Right([paymentEntityMock]));
    final result = await _usecase.call();
    expect(result.fold(id, id), isA<List<PaymentEntity>>());
  });
  test('deve retornar um erro caso falhar', () async {
    when(() => _repository.call()).thenAnswer(
      (invocation) async => const Left(
        AppException(
          message: 'falha no usecase',
          stackTrace: StackTrace.empty,
        ),
      ),
    );
    final result = await _usecase.call();
    expect(result.fold(id, id), isA<Exception>());
  });
}
