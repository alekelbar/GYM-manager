import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:gym_app/domain/datasources/firebase_auth_datasource.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthDatasourceImpl extends FirebaseAuthDatasource {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<UserCredential?> signInWithGoogle() async {
    // Trigger the authentication flow
    try {
      print("hello 0");

      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      print("hello 1");
      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      print("hello 2");

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      print("hello 3");

      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on PlatformException catch (e) {
      print(e);
    }
    return null;
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
