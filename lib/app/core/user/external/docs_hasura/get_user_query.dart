const getUserQuery = r'''query MyQuery($email: String!) {
  beauticians(where: {email: {_eq: $email}}) {
    id
    name
  }
}
''';
