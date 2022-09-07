import 'package:innova_estetica/app/features/clients/domain/entities/client_entity.dart';

class ClientsState {
  final List<ClientEntity> listClients;
  final ClientEntity? client;
  ClientsState({
    required this.listClients,
    required this.client,
  });

  bool get emptyMeasurements =>
      client?.abdomen == null && client?.height == null && client?.waist == null && client?.weight == null && client?.hip == null;

  bool get emptyPlans => client?.plan == null && client?.procediment == null && client?.qtdSections == null;

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
