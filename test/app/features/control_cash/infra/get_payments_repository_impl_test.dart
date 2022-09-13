import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:innova_estetica/app/core/shared/exceptions/app_exception.dart';
import 'package:innova_estetica/app/features/control_cash/external/model/payment_model.dart';
import 'package:innova_estetica/app/features/control_cash/infra/datasource/i_get_payments_datasource.dart';
import 'package:innova_estetica/app/features/control_cash/infra/repository/get_payments_repository.dart';
import 'package:mocktail/mocktail.dart';

class _DatasourceMock extends Mock implements IGetPaymentsDatasource {}

void main() {
  final _datasource = _DatasourceMock();
  final _repository = GetPaymentsRepositoryImpl(_datasource);

  final _mock = PaymentModel(
    name: 'name',
    date: DateTime.parse('2010-01-01'),
    formPayment: 'formPayment',
    description: '',
  );

  test('deve retornar um lista de PaymentModel caso sucesso', () async {
    when(() => _datasource.getPayments()).thenAnswer((invocation) async => [_mock]);
    final result = await _repository.call();
    expect(result.fold(id, id), isA<List<PaymentModel>>());
  });
  test('deve retornar um erro caso falhar', () async {
    when(() => _datasource.getPayments()).thenThrow(
      (invocation) async => const AppException(
        message: 'falha no repository',
        stackTrace: StackTrace.empty,
      ),
    );
    final result = await _repository.call();
    expect(result.fold(id, id), isA<Exception>());
  });
}
