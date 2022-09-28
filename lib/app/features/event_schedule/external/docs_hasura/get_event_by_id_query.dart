const getEventByIdQuery = r'''query MyQuery {
  schedule_event {
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
