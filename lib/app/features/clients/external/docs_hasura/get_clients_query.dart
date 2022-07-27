const getClientsQuery = r'''query MyQuery {
  clients {
    name
    cpf
    birth_data
    age
    current_weight
    height
    hip
    id_beautician
    plan
    procediment
    qtd_sections
    waist
    weight
    abdomen
    adress {
      cep
      city
      district
      number
      road
    }
  }
}
''';
