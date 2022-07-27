import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:innova_estetica/app/core/shared/exceptions/app_exception.dart';
import 'package:innova_estetica/app/core/user/domain/entities/user_entity.dart';
import 'package:innova_estetica/app/core/user/domain/repository/i_get_user_repository.dart';
import 'package:innova_estetica/app/core/user/domain/usecase/i_get_user_usecase.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mock/user_entity_mock.dart';

class _RepositoryMock extends Mock implements IGetUserRepository {}

void main() {
  final _repository = _RepositoryMock();
  final _usecase = GetUserUsecaseImpl(_repository);

  test('deve retornar um UserEntity caso sucesso', () async {
    when(() => _repository.call('teste')).thenAnswer((invocation) async => const Right(userEntityMock));
    final result = await _usecase.call('teste');
    expect(result.fold(id, id), isA<UserEntity>());
  });
  test('deve retornar um erro caso falhar', () async {
    when(() => _repository.call('teste')).thenAnswer(
      (invocation) async => const Left(
        AppException(message: 'falha no usecase', stackTrace: StackTrace.empty),
      ),
    );
    final result = await _usecase.call('teste');
    expect(result.fold(id, id), isA<Exception>());
  });
}
