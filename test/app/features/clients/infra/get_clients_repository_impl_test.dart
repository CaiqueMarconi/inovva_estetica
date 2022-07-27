import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:innova_estetica/app/features/clients/domain/entities/client_entity.dart';
import 'package:innova_estetica/app/features/clients/domain/error/get_client_failure.dart';
import 'package:innova_estetica/app/features/clients/external/model/client_model.dart';
import 'package:innova_estetica/app/features/clients/infra/datasource/i_get_clients_datasource.dart';
import 'package:innova_estetica/app/features/clients/infra/repository/get_client_repository_impl.dart';
import 'package:mocktail/mocktail.dart';

class _DatasourceMock extends Mock implements IGetClientsDatasource {}

void main() {
  final _datasource = _DatasourceMock();
  final _repository = GetClientsRepositoryImpl(_datasource);

  final _mock = ClientModel(
    name: 'name',
    cpf: 'cpf',
    birthData: 'birthData',
    age: 10,
    currentWeight: 10,
    height: 10,
    hip: 10,
    idBeautician: 10,
    plan: 'plan',
    procediment: 'procediment',
    qtdSections: 10,
    waist: 10,
    weight: 10,
    abdomen: 10,
    cep: 'cep',
    city: 'city',
    district: 'district',
    number: 10,
    road: 'road',
  );

  test('deve retornar um ClientModel caso sucesso', () async {
    when(() => _datasource.getClients()).thenAnswer((invocation) async => [_mock]);
    final result = await _repository.call();
    expect(result.fold(id, id), isA<List<ClientEntity>>());
  });
  test('deve retornar um erro caso falhar', () async {
    when(() => _datasource.getClients()).thenThrow((invocation) async => GetClientError('falha no repository'));
    final result = await _repository.call();
    expect(result.fold(id, id), isA<Exception>());
  });
}
