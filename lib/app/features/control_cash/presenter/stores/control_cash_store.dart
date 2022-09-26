import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:innova_estetica/app/core/user/store/user_store.dart';
import 'package:innova_estetica/app/features/clients/domain/usecase/i_get_clients_usecase.dart';
import 'package:innova_estetica/app/features/control_cash/domain/entity/control_cash_entity.dart';
import 'package:innova_estetica/app/features/control_cash/domain/usecase/i_get_payments_usecase.dart';
import 'package:innova_estetica/app/features/control_cash/domain/usecase/i_insert_payments_usecase.dart';
import 'package:innova_estetica/app/features/control_cash/presenter/stores/control_cash_state.dart';

// ignore: must_be_immutable
class ControlCashStore extends StreamStore<Exception, ControlCashState> {
  final IGetClientsUsecase _iGetClientsUsecase;
  final IGetPaymentsUsecase _getPaymentsUsecase;
  final IInsertPaymentsUsecase _insertPaymentsUsecase;
  ControlCashStore(
    this._iGetClientsUsecase,
    this._getPaymentsUsecase,
    this._insertPaymentsUsecase,
  ) : super(ControlCashState.init());

  TextEditingController descriptionController = TextEditingController();
  TextEditingController valueController = TextEditingController();

  Future<void> getClients() async {
    setLoading(true);
    final result = await _iGetClientsUsecase.call();
    result.fold(
      (l) => l,
      (r) => update(
        state.copyWith(listClients: r),
      ),
    );
    setLoading(false);
  }

  Future<void> getPayments() async {
    final result = await _getPaymentsUsecase.call();
    result.fold(
      (l) => l,
      (r) => update(
        state.copyWith(listPayments: r),
      ),
    );
  }

  Future<void> insertPayments() async {
    final store = Modular.get<UserStore>();
    final params = ControlCashEntity(
      idBeautician: store.state.currentUser.id,
      formPayment: state.listTypePayment.first,
      idUser: state.listClients.first.id!,
      valueInputed: double.parse(valueController.text),
      descriptionValue: state.listInputOrOutputValue.first,
      description: descriptionController.text,
    );
    final result = await _insertPaymentsUsecase.call(params);
    result.fold((l) => l, (r) async {
      await getPayments();
      valueController.clear();
      Asuka.showSnackBar(
        const SnackBar(
          content: Text(
            'Inserido com sucesso!',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 3),
        ),
      );
    });
  }
}
