import 'package:flutter_triple/flutter_triple.dart';
import 'package:innova_estetica/app/features/clients/domain/usecase/i_get_clients_usecase.dart';
import 'package:innova_estetica/app/features/control_cash/presenter/stores/control_cash_state.dart';

class ControlCashStore extends StreamStore<Exception, ControlCashState> {
  final IGetClientsUsecase _iGetClientsUsecase;
  ControlCashStore(
    this._iGetClientsUsecase,
  ) : super(ControlCashState.init());

  Future<void> getClients() async {
    final result = await _iGetClientsUsecase.call();
    result.fold(
      (l) => l,
      (r) => update(
        state.copyWith(listClients: r),
      ),
    );
  }
}
