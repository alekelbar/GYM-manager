import 'dart:io';
import 'package:gym_controller/domain/entities/register_entity.dart';

abstract class FirebaseRegisterDatasource {
  Stream<RegisterEntity> getRegisters({required String userEmail});

  Future<RegisterEntity?> updateRegister({required RegisterEntity entity});

  Future<RegisterEntity?> deleteRegister({required String idRegister});

  Future<RegisterEntity?> createRegister({required RegisterEntity entity});

  Future<String?> uploadImage({required File image});
}
