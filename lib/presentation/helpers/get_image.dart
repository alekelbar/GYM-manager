import 'dart:io';

import 'package:image_picker/image_picker.dart';

Future<File?> getImage([bool fromCam = false]) async {
  final picker = ImagePicker();
  final XFile? image = await picker.pickImage(
      source: fromCam ? ImageSource.camera : ImageSource.gallery);

  if (image == null) return null;

  return File(image.path);
}
