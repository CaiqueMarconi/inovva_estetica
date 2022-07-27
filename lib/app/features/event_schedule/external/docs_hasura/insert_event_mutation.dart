const insertEventMutation = r'''mutation MyMutation ($object: schedule_event_insert_input!) {
  insert_schedule_event_one(object: $object) {
    id
  }
}
''';
