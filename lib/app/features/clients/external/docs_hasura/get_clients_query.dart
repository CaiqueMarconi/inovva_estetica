const getClientsQuery = r'''query MyQuery {
  clients {
    id
    name
    cpf
    birth_data
    age
    id_beautician
    plan
    procediment
    qtd_sections
    adress {
      cep
      city
      district
      number
      road
    }
    measurements {
      abdomen_initial
      hip_initial
      height
      waist_initial
      weight_initial
    }
  }
}

''';
