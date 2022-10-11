import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_cropper/image_cropper.dart';

final imageCropperServiceProvider =
    ChangeNotifierProvider<ImageCropperService>((ref) {
  return ImageCropperService();
});

class ImageCropperService extends ChangeNotifier {
  CroppedFile? croppedFile;

  Future<File?> cropImage({required File imageFile}) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: imageFile.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: '画像編集',
            toolbarColor: const Color.fromARGB(255, 1, 184, 126),
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
      ],
    );
    if (croppedFile == null) return null;
    croppedFile = croppedFile;
    return File(croppedFile.path);
  }
}
