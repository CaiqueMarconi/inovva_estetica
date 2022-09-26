const getEventByIdQuery = r'''query MyQuery {
  schedule_event(where: {id_beautician: {_neq: 2}}) {
    time_initial
    time_final
    description
    id_beautician
    clients {
      name
    }
  }
}

''';
