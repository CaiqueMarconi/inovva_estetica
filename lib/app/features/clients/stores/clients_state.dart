import 'package:innova_estetica/app/features/clients/domain/entities/client_entity.dart';

class ClientsState {
  final List<ClientEntity> listClients;
  final ClientEntity? client;
  ClientsState({
    required this.listClients,
    required this.client,
  });

  factory ClientsState.init() => ClientsState(listClients: [], client: null);

  ClientsState copyWith({
    List<ClientEntity>? listClients,
    ClientEntity? client,
  }) {
    return ClientsState(
      listClients: listClients ?? this.listClients,
      client: client ?? this.client,
    );
  }
}
