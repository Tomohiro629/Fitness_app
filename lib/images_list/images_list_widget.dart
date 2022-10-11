import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:karaoke_app/components/account_button.dart';
import 'package:karaoke_app/entity/image_body.dart';
import 'package:karaoke_app/images_list/images_list_controller.dart';

import '../service/image_cropper_service.dart';
import '../service/image_picker_service.dart';

class ImagesListWidget extends ConsumerWidget {
  const ImagesListWidget({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageListController = ref.watch(imageListControllerProvider);
    final imagePicker = ref.watch(imagePickerServiceProvider);
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
          child: IconButton(
              onPressed: () {
                imagePicker.takeCamera();
                if (imagePicker.imagePath != null) {
                  ref
                      .watch(imageCropperServiceProvider)
                      .cropImage(imageFile: imagePicker.imagePath!);
                  showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (childContext) {
                        return AlertDialog(
                          content:
                              Card(child: Image.file(imagePicker.imagePath!)),
                          actions: [
                            Row(
                              children: [
                                AccountButton(
                                    splashColor: Colors.red,
                                    onTap: () {
                                      imageListController
                                          .setImage(imagePicker.imagePath);
                                    },
                                    strokeColor: Colors.red,
                                    text: "SET"),
                                AccountButton(
                                    splashColor: Colors.indigo,
                                    onTap: () {
                                      imagePicker.takeCamera();
                                      if (imagePicker.imagePath != null) {
                                        ref
                                            .watch(imageCropperServiceProvider)
                                            .cropImage(
                                                imageFile:
                                                    imagePicker.imagePath!);
                                      }
                                    },
                                    strokeColor: Colors.indigo,
                                    text: "RESHOOT")
                              ],
                            )
                          ],
                        );
                      });
                }
              },
              icon: const Icon(
                Icons.add_a_photo_outlined,
                color: Color.fromARGB(255, 184, 13, 1),
              )),
        ),
      ],
    );
  }
}
