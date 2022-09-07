import 'package:innova_estetica/app/features/auth/domain/entity/user_credentials_entity.dart';

abstract class IFirebaseLoginWithEmailDatasource {
  Future<UserCredentialEntity> call(String email, String password);
}
