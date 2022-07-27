import 'package:innova_estetica/app/features/clients/domain/entities/client_entity.dart';

class ClientsState {
  final List<ClientEntity> listClients;
  ClientsState({
    required this.listClients,
  });

  factory ClientsState.init() => ClientsState(listClients: []);

  ClientsState copyWith({
    List<ClientEntity>? listClients,
  }) {
    return ClientsState(
      listClients: listClients ?? this.listClients,
    );
  }
}
