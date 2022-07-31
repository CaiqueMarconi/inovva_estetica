import 'package:innova_estetica/app/features/clients/domain/entities/client_entity.dart';

class EventState {
  final bool showForm;
  final List<ClientEntity> listClients;
  EventState({
    required this.showForm,
    required this.listClients,
  });

  factory EventState.init() => EventState(
        showForm: false,
        listClients: [],
      );

  EventState copyWith({
    bool? showForm,
    List<ClientEntity>? listClients,
  }) {
    return EventState(
      showForm: showForm ?? this.showForm,
      listClients: listClients ?? this.listClients,
    );
  }
}
