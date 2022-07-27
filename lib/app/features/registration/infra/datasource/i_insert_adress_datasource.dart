import '../../domain/entities/adress_entity.dart';

abstract class IInsertAdressDatasource {
  Future<int> insertAdress(AdressEntity params);
}
