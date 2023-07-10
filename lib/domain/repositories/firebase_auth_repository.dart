import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseAuthRepository {
  Future<UserCredential?> signInWithGoogle();
  Future<bool> signOutWithGoogle();
}
