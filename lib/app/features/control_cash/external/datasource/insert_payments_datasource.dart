import 'package:innova_estetica/app/core/services/hasura/hasura_service.dart';
import 'package:innova_estetica/app/core/shared/exceptions/hasura_exception.dart';
import 'package:innova_estetica/app/features/control_cash/domain/entity/control_cash_entity.dart';
import 'package:innova_estetica/app/features/control_cash/infra/datasource/i_insert_payments_datasource.dart';

import '../docs_hasura/insert_value_mutation.dart';

class InsertPaymentsDatasource implements IInsertPaymentsDatasource {
  final HasuraService _hasuraService;

  InsertPaymentsDatasource(this._hasuraService);
  @override
  Future<int> call(ControlCashEntity params) async {
    try {
      final hasuraResponse = await _hasuraService.mutation(
        docQuery: insertValueMutation,
        variables: {
          'object': {
            'id_beautician': params.idBeautician,
            'id_user': params.idUser,
            'input_value': params.valueInputed,
            'forms_payment': params.formPayment,
            'description_value_inputed': params.descriptionValue,
          },
        },
      );
      final result = hasuraResponse['data']['insert_control_cash_one']['id'];
      return result;
    } catch (e) {
      throw HasuraAppException(message: e.toString());
    }
  }
}
