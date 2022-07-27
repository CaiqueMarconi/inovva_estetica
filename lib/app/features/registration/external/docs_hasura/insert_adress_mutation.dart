const insertAdressMutation =
    r'''mutation MyMutation ($object: adress_insert_input!) {
  insert_adress_one(object: $object) {
    id
  }
}
''';
