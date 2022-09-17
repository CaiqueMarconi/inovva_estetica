import 'package:innova_estetica/app/features/clients/domain/entities/client_entity.dart';

import '../../domain/entity/payment_entity.dart';

class ControlCashState {
  final List<ClientEntity> listClients;
  final List<String> listInputOrOutputValue;
  final List<String> listTypePayment;
  final List<PaymentEntity> listPayments;
  ControlCashState({
    required this.listClients,
    required this.listInputOrOutputValue,
    required this.listTypePayment,
    required this.listPayments,
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
        listPayments: [],
      );

  ControlCashState copyWith({
    List<ClientEntity>? listClients,
    List<String>? listInputOrOutputValue,
    List<String>? listTypePayment,
    List<PaymentEntity>? listPayments,
  }) {
    return ControlCashState(
      listClients: listClients ?? this.listClients,
      listInputOrOutputValue: listInputOrOutputValue ?? this.listInputOrOutputValue,
      listTypePayment: listTypePayment ?? this.listTypePayment,
      listPayments: listPayments ?? this.listPayments,
    );
  }
}
