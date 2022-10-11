import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:karaoke_app/entity/image_body.dart';
import 'package:karaoke_app/repository/image_repository.dart';
import 'package:karaoke_app/service/auth_service.dart';

final imageListControllerProvider =
    ChangeNotifierProvider<ImageListController>((ref) {
  return ImageListController(
    ref.read,
  );
});

class ImageListController extends ChangeNotifier {
  final Reader _reader;
  ImageListController(
    this._reader,
  );

  Stream<List<ImageBody>> fetchImageStream() {
    return _reader(imageRepositoryProvider).fetchImageStream();
  }

  Future<void> setImage({required String imageURL}) async {
    final userId = _reader(authServiceProvider).userId;
    final recordImage = ImageBody.create(imageURL: imageURL, userId: userId);
    await _reader(imageRepositoryProvider).setImage(image: recordImage);
    notifyListeners();
  }
}
