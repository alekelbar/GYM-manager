import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:gym_controller/domain/datasources/firebase_register_datasource.dart';
import 'package:gym_controller/domain/entities/register_entity.dart';
import 'package:gym_controller/infrastructure/mapper/register_mapper.dart';
import 'package:gym_controller/infrastructure/models/register_model.dart';
import 'package:uuid/uuid.dart';

class FirebaseRegisterDatasourceImpl extends FirebaseRegisterDatasource {
  final instance = FirebaseFirestore.instance;
  final fireStorage = FirebaseStorage.instance;

  @override
  Future<RegisterEntity?> createRegister(
      {required RegisterEntity entity}) async {
    final model = RegisterMapper.toRegisterModel(entity);

    try {
      final collectionRef = instance.collection("register_entity");

      final docRef = await collectionRef.add(RegisterModel.toJson(model));

      entity.id = docRef.id;
    } catch (e) {
      return null;
    }

    return entity;
  }

  @override
  Future<RegisterEntity?> deleteRegister({required String idRegister}) async {
    final docRef = instance.doc(idRegister);
    final doc = await docRef.get();

    if (!doc.exists) return null;

    try {
      docRef.delete();
    } catch (e) {
      return null;
    }

    return RegisterMapper.toRegisterEntity(RegisterModel.fromJson(doc.data()!));
  }

  @override
  Stream<RegisterEntity> getRegisters({required String userEmail}) async* {
    final registers = await instance
        .collection("register_entity")
        .where("userEmail", isEqualTo: userEmail)
        .get();

    for (var element in registers.docs) {
      final model = RegisterModel.fromJson(element.data());
      final entity = RegisterMapper.toRegisterEntity(model);
      yield entity;
    }
  }

  @override
  Future<RegisterEntity?> updateRegister(
      {required RegisterEntity entity}) async {
    final docRef = instance.doc(entity.id!);

    try {
      final model = RegisterMapper.toRegisterModel(entity);
      await docRef.update(RegisterModel.toJson(model));
    } catch (e) {
      return null;
    }

    final doc = await docRef.get();

    if (!doc.exists) return null;
    return RegisterMapper.toRegisterEntity(RegisterModel.fromJson(doc.data()!));
  }

  @override
  Future<String?> uploadImage({required File image}) async {
    const uuid = Uuid();

    UploadTask uploadTask;

    try {
      Reference ref = fireStorage
          .ref()
          .child("images")
          .child(uuid.v5(Uuid.NAMESPACE_URL, 'www.google.com'));

      uploadTask = ref.putFile(image);

      await uploadTask.whenComplete(() => null);
      return await ref.getDownloadURL();
    } on Exception {
      return null;
    }
  }
}
