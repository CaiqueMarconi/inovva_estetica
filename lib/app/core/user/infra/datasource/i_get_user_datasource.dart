import 'package:innova_estetica/app/core/user/external/model/user_model.dart';

abstract class IGetUserDatasource {
  Future<UserModel> getUser(String email);
}
