import 'dart:io';

import 'package:gym_app/domain/datasources/firebase_register_datasource.dart';
import 'package:gym_app/domain/entities/register_entity.dart';
import 'package:gym_app/domain/repositories/firebase_register_repository.dart';

class FirebaseRegisterRepositoryImpl extends FirebaseRegisterRepository {
  final FirebaseRegisterDatasource datasource;

  FirebaseRegisterRepositoryImpl(this.datasource);

  @override
  Future<RegisterEntity?> createRegister({required RegisterEntity entity}) {
    return datasource.createRegister(entity: entity);
  }

  @override
  Future<RegisterEntity?> deleteRegister({required String idRegister}) {
    return datasource.deleteRegister(idRegister: idRegister);
  }

  @override
  Stream<RegisterEntity> getRegisters({required String userEmail}) async* {
    yield* datasource.getRegisters(userEmail: userEmail);
  }

  @override
  Future<RegisterEntity?> updateRegister({required RegisterEntity entity}) {
    return datasource.updateRegister(entity: entity);
  }

  @override
  Future<String?> uploadImage({required File image}) {
    return datasource.uploadImage(image: image);
  }
}
