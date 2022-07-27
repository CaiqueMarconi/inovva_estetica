import 'package:flutter_test/flutter_test.dart';
import 'package:innova_estetica/app/core/services/hasura/hasura_service.dart';
import 'package:innova_estetica/app/core/shared/exceptions/hasura_exception.dart';
import 'package:innova_estetica/app/features/clients/domain/entities/client_entity.dart';
import 'package:innova_estetica/app/features/clients/external/datasource/get_clients_datasource_impl.dart';
import 'package:innova_estetica/app/features/clients/external/docs_hasura/get_clients_query.dart';
import 'package:mocktail/mocktail.dart';

class HasuraClientMock extends Mock implements HasuraService {}

void main() {
  final hasuraClient = HasuraClientMock();
  final datasource = GetClientsDatasourceImpl(hasuraClient);

  final mockResultHasura = {
    "data": {
      "clients": [
        {
          "name": "teste first",
          "cpf": null,
          "birth_data": null,
          "age": 27,
          "created_at": "2022-07-19T01:30:09.291341+00:00",
          "current_weight": null,
          "height": 1.72,
          "hip": 33.0,
          "id_beautician": null,
          "plan": "pacote teste",
          "procediment": "Carbox",
          "qtd_sections": 10,
          "updated_at": "2022-07-19T01:30:09.291341+00:00",
          "waist": 40.0,
          "weight": 83.65,
          "abdomen": 62.0,
          "adress": {"cep": "15802-355", "city": null, "district": "Bairro teste", "number": 65, "road": "Rua teste"}
        },
      ]
    }
  };

  test('deve retornar um Lista de CLientEntity caso sucess', () async {
    when(() => hasuraClient.query(docQuery: getClientsQuery)).thenAnswer(
      (invocation) async => mockResultHasura,
    );
    final result = await datasource.getClients();
    expect(result, isA<List<ClientEntity>>());
    verify(() => hasuraClient.query(docQuery: getClientsQuery)).called(1);
  });
  test('deve retornar um erro caso falhar', () async {
    when(() => hasuraClient.query(docQuery: getClientsQuery)).thenThrow(
      const HasuraAppException(message: 'falha no datasource'),
    );
    final result = datasource.getClients;
    expect(() async => result(), throwsA(isA<Exception>()));
    verify(() => hasuraClient.query(docQuery: getClientsQuery)).called(1);
  });
}
