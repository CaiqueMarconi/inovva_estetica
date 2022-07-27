import 'package:flutter_triple/flutter_triple.dart';
import 'package:innova_estetica/app/features/clients/domain/usecase/i_get_clients_usecase.dart';
import 'package:innova_estetica/app/features/clients/stores/clients_state.dart';

class ClientsStore extends StreamStore<Exception, ClientsState> {
  final IGetClientsUsecase _getClientsUsecase;
  ClientsStore(this._getClientsUsecase) : super(ClientsState.init());

  Future<void> getCLients() async {
    final result = await _getClientsUsecase.call();
    result.fold((l) => l, (r) {
      update(
        state.copyWith(listClients: r),
      );
    });
  }
}
