const insertValueMutation = r'''mutation MyMutation($object: control_cash_insert_input!) {
  insert_control_cash_one(object: $object) {
    id
  }
}
''';
