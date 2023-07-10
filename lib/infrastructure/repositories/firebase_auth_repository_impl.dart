import 'package:firebase_auth/firebase_auth.dart';
import 'package:gym_controller/domain/datasources/firebase_auth_datasource.dart';
import 'package:gym_controller/domain/repositories/firebase_auth_repository.dart';

class FirebaseAuthRepositoryImpl extends FirebaseAuthRepository {
  final FirebaseAuthDatasource datasource;

  FirebaseAuthRepositoryImpl({required this.datasource});

  @override
  Future<UserCredential?> signInWithGoogle() async {
    return await datasource.signInWithGoogle();
  }

  @override
  Future<bool> signOutWithGoogle() {
    return datasource.signOutWithGoogle();
  }
}
