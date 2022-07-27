const getEventByIdQuery = r'''query MyQuery ($id_client: Int!){
  schedule_event(where: {id_client: {_eq: $id_client}}) {
    time_initial
    time_final
    description
    clients {
      name
    }
  }
}
''';
