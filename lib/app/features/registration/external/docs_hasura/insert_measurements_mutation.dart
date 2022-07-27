const insertMeasurementsMutation = r'''mutation MyMutation ($object: measurements_insert_input!){
  insert_measurements_one(object: $object) {
    id
  }
}
''';
