const getEventByIdQuery = r'''query MyQuery{
  schedule_event {
    time_initial
    time_final
    description
    clients {
      name
    }
  }
}
''';
