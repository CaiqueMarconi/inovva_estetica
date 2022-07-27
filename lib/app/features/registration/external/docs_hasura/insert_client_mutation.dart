const insertClientMutation =
    r'''mutation MyMutation ($object: clients_insert_input!){
  insert_clients_one(object: $object, on_conflict: {constraint: clients_pkey}) {
    id
  }
}
''';
