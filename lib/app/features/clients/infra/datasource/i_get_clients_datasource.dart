import 'package:innova_estetica/app/features/clients/external/model/client_model.dart';

abstract class IGetClientsDatasource {
  Future<List<ClientModel>> getClients();
}
