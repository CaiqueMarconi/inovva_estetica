import 'package:innova_estetica/app/features/registration/domain/entities/client_data_entity.dart';

abstract class IInsertClientDatasource {
  Future<int> insertClient(ClientDataEntity params);
}
