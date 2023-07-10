import 'package:firebase_auth/firebase_auth.dart';
import 'package:gym_controller/domain/datasources/firebase_auth_datasource.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthDatasourceImpl extends FirebaseAuthDatasource {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<UserCredential?> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Future<bool> signOutWithGoogle() async {
    try {
      await _auth.signOut();
      await GoogleSignIn().signOut();
      return true;
    } catch (e) {
      return false;
    }
  }
}
