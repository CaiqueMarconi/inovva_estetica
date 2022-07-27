abstract class IFirebaseService {
  Future<void> signIn(String email, String password);
  Future<void> signOut();
}
