import 'package:innova_estetica/app/features/clients/domain/entities/client_entity.dart';

class ControlCashState {
  final List<ClientEntity> listClients;
  final List<String> listInputOrOutputValue;
  final List<String> listTypePayment;
  ControlCashState({
    required this.listClients,
    required this.listInputOrOutputValue,
    required this.listTypePayment,
  });

  factory ControlCashState.init() => ControlCashState(
        listClients: [],
        listInputOrOutputValue: [
          //'o Valor sera registrado como?',
          'Entrada',
          'Saida',
        ],
        listTypePayment: [
          // 'Forma de Pagamento',
          'Cartão',
          'Dinheiro',
          'Pix',
        ],
      );

  ControlCashState copyWith({
    List<ClientEntity>? listClients,
    List<String>? listInputOrOutputValue,
    List<String>? listTypePayment,
  }) {
    return ControlCashState(
      listClients: listClients ?? this.listClients,
      listInputOrOutputValue: listInputOrOutputValue ?? this.listInputOrOutputValue,
      listTypePayment: listTypePayment ?? this.listTypePayment,
    );
  }
}
