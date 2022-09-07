import 'package:innova_estetica/app/features/auth/domain/entity/user_credentials_entity.dart';

abstract class IFirebaseService {
  Future<UserCredentialEntity> signIn(String email, String password);
  Future<void> signOut();
}
