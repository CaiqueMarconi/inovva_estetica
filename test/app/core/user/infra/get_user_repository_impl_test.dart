import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:innova_estetica/app/core/shared/exceptions/app_exception.dart';
import 'package:innova_estetica/app/core/user/domain/entities/user_entity.dart';
import 'package:innova_estetica/app/core/user/external/model/user_model.dart';
import 'package:innova_estetica/app/core/user/infra/datasource/i_get_user_datasource.dart';
import 'package:innova_estetica/app/core/user/infra/repository/get_user_repository_impl.dart';
import 'package:mocktail/mocktail.dart';

class _DatasourceMock extends Mock implements IGetUserDatasource {}

void main() {
  final _datasource = _DatasourceMock();
  final _repository = GetUserRepositoryImpl(_datasource);

  const _mock = UserModel(name: 'teste', id: 10);

  test('deve retornar um UserEntity caso sucesso', () async {
    when(() => _datasource.getUser('teste')).thenAnswer((invocation) async => _mock);
    final result = await _repository.call('teste');
    expect(result.fold(id, id), isA<UserEntity>());
  });
  test('deve retornar um erro caso falhar', () async {
    when(() => _datasource.getUser('teste')).thenThrow(
      (invocation) async => const AppException(
        message: 'falha no repository',
        stackTrace: StackTrace.empty,
      ),
    );
    final result = await _repository.call('teste');
    expect(result.fold(id, id), isA<Exception>());
  });
}
