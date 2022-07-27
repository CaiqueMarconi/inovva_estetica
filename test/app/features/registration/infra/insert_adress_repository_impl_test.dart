import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:innova_estetica/app/features/registration/domain/error/insert_adress_failure.dart';
import 'package:innova_estetica/app/features/registration/infra/datasource/i_insert_adress_datasource.dart';
import 'package:innova_estetica/app/features/registration/infra/repository/insert_adress_repository_impl.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mock/adress_entity_mock.dart';

class _DatasourceMock extends Mock implements IInsertAdressDatasource {}

void main() {
  late IInsertAdressDatasource _datasource;
  late InsertAdressRepositoryImpl _repository;

  setUpAll(() {
    _datasource = _DatasourceMock();
    _repository = InsertAdressRepositoryImpl(_datasource);
  });

  test('deve retornar um int caso sucesso', () async {
    when(() => _datasource.insertAdress(adressEntityMock))
        .thenAnswer((invocation) async => 10);
    final result = await _repository.call(adressEntityMock);
    expect(result.fold(id, id), isA<int>());
  });
  test('deve retornar um erro caso falhar', () async {
    when(() => _datasource.insertAdress(adressEntityMock))
        .thenThrow((invocation) async => InsertAdressError('falha no usecase'));
    final result = await _repository.call(adressEntityMock);
    expect(result.fold(id, id), isA<Exception>());
  });
}
