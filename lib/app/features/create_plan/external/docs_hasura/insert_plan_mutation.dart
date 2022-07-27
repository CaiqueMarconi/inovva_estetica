const insertPlanMutation = r'''mutation MyMutation ($object: packages_insert_input!){
  insert_packages_one(object: $object) {
    id
  }
}
''';
