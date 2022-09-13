const getPaymentsQuery = r'''query MyQuery {
  control_cash(order_by: {created_at: asc}) {
    forms_payment
    description
    created_at
    clients {
      name
    }
  }
}
''';
