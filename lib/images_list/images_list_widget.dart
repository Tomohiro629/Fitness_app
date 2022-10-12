import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:karaoke_app/service/common_method.dart';

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
    final isVisible = imageListController.isVisible;

    return Stack(
      children: [
        Column(
          children: [
            Visibility(
              visible: isVisible,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Center(
                    child: SizedBox(
                        width: 150.0,
                        child: Column(
                          children: const [
                            LinearProgressIndicator(),
                            Gap(10.0),
                            Text("Loading...")
                          ],
                        )),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    height: 380.0,
                    child: StreamBuilder<List<ImageBody>>(
                        stream: imageListController.fetchImageStream(),
                        builder:
                            (context, AsyncSnapshot<List<ImageBody>> snapshot) {
                          if (snapshot.hasData) {
                            return ListView(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              children: snapshot.data!.map((ImageBody image) {
                                return Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        width: 380.0,
                                        child: Image.network(image.imageURL),
                                      ),
                                      const Gap(10),
                                      Text(
                                          "${getDateString(image.recordTime)} 撮影")
                                    ],
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
                ],
              ),
            ),
          ],
        ),
        if (isVisible == false)
          Container(
            color: const Color.fromARGB(139, 52, 50, 50),
            width: double.infinity,
            height: 380.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("センシティブな内容が含まれます。"),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: InkWell(
                    onTap: () {
                      imageListController.setIsVisible();
                    },
                    child: const Text("表示"),
                  ),
                )
              ],
            ),
          ),
        Align(
          alignment: Alignment.bottomLeft,
          child: isVisible == true
              ? CircleAvatar(
                  backgroundColor: Colors.black,
                  child: IconButton(
                    icon: const Icon(Icons.visibility),
                    color: const Color.fromARGB(255, 184, 1, 1),
                    onPressed: () {
                      imageListController.setIsVisible();
                    },
                  ),
                )
              : CircleAvatar(
                  backgroundColor: Colors.black,
                  child: IconButton(
                    icon: const Icon(Icons.visibility_off),
                    color: Colors.blueAccent,
                    onPressed: () {
                      imageListController.setIsVisible();
                    },
                  ),
                ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: imagePicker.imagePath != null
              ? CircleAvatar(
                  backgroundColor: Colors.black,
                  child: IconButton(
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
                                      color: Color.fromARGB(255, 184, 1, 138),
                                    ),
                                  ],
                                ),
                              );
                            });
                        await ref
                            .watch(storageServiceProvider)
                            .uploadPostImageAndGetUrl(
                                file: imagePicker.imagePath!);
                        await imageListController.setImage(
                            imageURL:
                                ref.watch(storageServiceProvider).imageURL!);
                        imagePicker.imagePath = null;
                        // ignore: use_build_context_synchronously
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.add,
                        color: Color.fromARGB(255, 184, 1, 138),
                      )),
                )
              : CircleAvatar(
                  backgroundColor: Colors.black,
                  child: IconButton(
                      onPressed: () async {
                        imagePicker.imagePath = null;
                        imagePicker.takeCamera();
                        if (imagePicker.imagePath != null) {
                          croppedImage.cropImage(
                              imageFile: imagePicker.imagePath!);
                        }
                      },
                      icon: const Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.blueAccent,
                      )),
                ),
        ),
      ],
    );
  }
}
