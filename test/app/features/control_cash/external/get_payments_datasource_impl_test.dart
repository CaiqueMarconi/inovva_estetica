import 'package:flutter_test/flutter_test.dart';
import 'package:innova_estetica/app/core/services/hasura/hasura_service.dart';
import 'package:innova_estetica/app/core/shared/exceptions/hasura_exception.dart';
import 'package:innova_estetica/app/features/control_cash/domain/entity/payment_entity.dart';
import 'package:innova_estetica/app/features/control_cash/external/datasource/get_payments_datasource_impl.dart';
import 'package:innova_estetica/app/features/control_cash/external/docs_hasura/get_payments_query.dart';
import 'package:mocktail/mocktail.dart';

class HasuraClientMock extends Mock implements HasuraService {}

void main() {
  final hasuraClient = HasuraClientMock();
  final datasource = GetPaymentsDatasourceImpl(hasuraClient);

  final mockResultHasura = {
    "data": {
      "control_cash": [],
    }
  };

  test('deve retornar um Lista de PaymentEntity caso sucess', () async {
    when(() => hasuraClient.query(docQuery: getPaymentsQuery)).thenAnswer(
      (invocation) async => mockResultHasura,
    );
    final result = await datasource.getPayments();
    expect(result, isA<List<PaymentEntity>>());
    verify(() => hasuraClient.query(docQuery: getPaymentsQuery)).called(1);
  });
  test('deve retornar um erro caso falhar', () async {
    when(() => hasuraClient.query(docQuery: getPaymentsQuery)).thenThrow(
      const HasuraAppException(message: 'falha no datasource'),
    );
    final result = datasource.getPayments;
    expect(() async => result(), throwsA(isA<Exception>()));
    verify(() => hasuraClient.query(docQuery: getPaymentsQuery)).called(1);
  });
}
