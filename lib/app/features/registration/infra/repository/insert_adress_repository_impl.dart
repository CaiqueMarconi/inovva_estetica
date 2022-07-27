import 'package:dartz/dartz.dart';
import 'package:innova_estetica/app/features/registration/domain/entities/adress_entity.dart';
import 'package:innova_estetica/app/features/registration/infra/datasource/i_insert_adress_datasource.dart';

import '../../domain/error/insert_adress_failure.dart';
import '../../domain/repository/i_insert_adress_repository.dart';

class InsertAdressRepositoryImpl implements IInsertAdressRepository {
  final IInsertAdressDatasource _datasource;

  InsertAdressRepositoryImpl(this._datasource);
  @override
  Future<Either<IInsertAdressFailure, int>> call(AdressEntity params) async {
    try {
      final result = await _datasource.insertAdress(params);
      return Right(result);
    } on IInsertAdressFailure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(InsertAdressError('falha no repository $e'));
    }
  }
}
