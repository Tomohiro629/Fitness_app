import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../entity/image_body.dart';
import '../service/cloud_storage_service.dart';
import '../service/image_cropper_service.dart';
import '../service/image_picker_service.dart';
import 'images_list_controller.dart';

class ImagesListWidget extends ConsumerWidget {
  const ImagesListWidget({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageListController = ref.watch(imageListControllerProvider);
    final imagePicker = ref.watch(imagePickerServiceProvider);
    final croppedImage = ref.watch(imageCropperServiceProvider);
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          height: 350.0,
          child: StreamBuilder<List<ImageBody>>(
              stream: imageListController.fetchImageStream(),
              builder: (context, AsyncSnapshot<List<ImageBody>> snapshot) {
                if (snapshot.hasData) {
                  return ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: snapshot.data!.map((ImageBody image) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: 300.0,
                          width: 500.0,
                          color: Colors.blueGrey,
                          child: Image.network(image.imageURL),
                        ),
                      );
                    }).toList(),
                  );
                }
                if (snapshot.hasError) {}
                return const Center(
                  child: Text("no data"),
                );
              }),
        ),
        Align(
          alignment: Alignment.topRight,
          child: imagePicker.imagePath != null
              ? IconButton(
                  onPressed: () async {
                    showGeneralDialog(
                        context: context,
                        barrierColor: Colors.black.withOpacity(0.5),
                        pageBuilder: (BuildContext context, animation,
                            secondaryAnimation) {
                          return Center(
                            child: Stack(
                              children: const [
                                CircularProgressIndicator(
                                  color: Colors.greenAccent,
                                ),
                              ],
                            ),
                          );
                        });
                    await ref
                        .watch(storageServiceProvider)
                        .uploadPostImageAndGetUrl(file: imagePicker.imagePath!);
                    await imageListController.setImage(
                        imageURL: ref.watch(storageServiceProvider).imageURL!);
                    imagePicker.imagePath = null;
                    // ignore: use_build_context_synchronously
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.add_a_photo_outlined,
                    color: Color.fromARGB(255, 184, 1, 138),
                  ))
              : IconButton(
                  onPressed: () async {
                    imagePicker.imagePath = null;
                    imagePicker.takeCamera();
                    if (imagePicker.imagePath != null) {
                      croppedImage.cropImage(imageFile: imagePicker.imagePath!);
                    }
                  },
                  icon: const Icon(
                    Icons.camera_alt_outlined,
                    color: Color.fromARGB(255, 1, 184, 126),
                  )),
        ),
      ],
    );
  }
}
