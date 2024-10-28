abstract class AuthenticationRepo {
  Future signIn({required String email, required String password});
  Future signUp({required String email, required String password});
  Future signOut();
}
