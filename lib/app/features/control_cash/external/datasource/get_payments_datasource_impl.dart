import 'package:innova_estetica/app/core/services/hasura/hasura_service.dart';
import 'package:innova_estetica/app/features/control_cash/external/docs_hasura/get_payments_query.dart';
import 'package:innova_estetica/app/features/control_cash/external/model/payment_model.dart';
import 'package:innova_estetica/app/features/control_cash/infra/datasource/i_get_payments_datasource.dart';

import '../../../../core/shared/exceptions/hasura_exception.dart';

class GetPaymentsDatasourceImpl implements IGetPaymentsDatasource {
  final HasuraService _hasuraService;

  GetPaymentsDatasourceImpl(this._hasuraService);
  @override
  Future<List<PaymentModel>> getPayments() async {
    try {
      final hasuraResponse = await _hasuraService.query(docQuery: getPaymentsQuery);
      final response = hasuraResponse['data']['control_cash'] as List;
      final result = response.map((e) => PaymentModel.fromMap(e)).toList();
      return result;
    } on HasuraAppException catch (e) {
      throw HasuraAppException(message: 'falha no datasource $e');
    } catch (e) {
      throw Exception(e);
    }
  }
}
