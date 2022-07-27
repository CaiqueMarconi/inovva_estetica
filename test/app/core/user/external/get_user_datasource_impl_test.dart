import 'package:flutter_test/flutter_test.dart';
import 'package:innova_estetica/app/core/services/hasura/hasura_service.dart';
import 'package:innova_estetica/app/core/shared/exceptions/hasura_exception.dart';
import 'package:innova_estetica/app/core/user/domain/entities/user_entity.dart';
import 'package:innova_estetica/app/core/user/external/datasource/get_user_datasource_impl.dart';
import 'package:innova_estetica/app/core/user/external/docs_hasura/get_user_query.dart';
import 'package:mocktail/mocktail.dart';

class HasuraClientMock extends Mock implements HasuraService {}

void main() {
  final hasuraClient = HasuraClientMock();
  final datasource = GetUserDatasourceImpl(hasuraClient);

  final mockResultHasura = {
    "data": {
      "beauticians": [
        {"id": 2, "name": "caique"}
      ]
    }
  };

  test('deve retornar um Lista de UserEntity caso sucess', () async {
    when(() => hasuraClient.query(docQuery: getUserQuery, variables: any(named: 'variables'))).thenAnswer(
      (invocation) async => mockResultHasura,
    );
    final result = await datasource.getUser('teste');
    expect(result, isA<UserEntity>());
    verify(() => hasuraClient.query(docQuery: getUserQuery, variables: any(named: 'variables'))).called(1);
  });
  test('deve retornar um erro caso falhar', () async {
    when(() => hasuraClient.query(docQuery: getUserQuery, variables: any(named: 'variables'))).thenThrow(
      const HasuraAppException(message: 'falha no datasource'),
    );
    final result = datasource.getUser;
    expect(() async => result('teste'), throwsA(isA<Exception>()));
    verify(() => hasuraClient.query(docQuery: getUserQuery, variables: any(named: 'variables'))).called(1);
  });
}
