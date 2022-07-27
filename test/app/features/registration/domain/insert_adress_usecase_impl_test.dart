import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:innova_estetica/app/features/registration/domain/error/insert_adress_failure.dart';
import 'package:innova_estetica/app/features/registration/domain/repository/i_insert_adress_repository.dart';
import 'package:innova_estetica/app/features/registration/domain/usecase/i_insert_adress_usecase.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mock/adress_entity_mock.dart';

class _RepositoryMock extends Mock implements IInsertAdressRepository {}

void main() {
  late IInsertAdressRepository _repository;
  late InsertAdressUsecaseImpl _usecase;

  setUpAll(() {
    _repository = _RepositoryMock();
    _usecase = InsertAdressUsecaseImpl(_repository);
  });

  test('deve retornar um int caso sucesso', () async {
    when(() => _repository.call(adressEntityMock))
        .thenAnswer((invocation) async => const Right(10));
    final result = await _usecase.call(adressEntityMock);
    expect(result.fold(id, id), isA<int>());
  });
  test('deve retornar um erro caso falhar', () async {
    when(() => _repository.call(adressEntityMock)).thenAnswer(
        (invocation) async => Left(InsertAdressError('falha no usecase')));
    final result = await _usecase.call(adressEntityMock);
    expect(result.fold(id, id), isA<Exception>());
  });
}
