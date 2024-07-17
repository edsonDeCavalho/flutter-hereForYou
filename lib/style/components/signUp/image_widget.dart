import 'dart:io';

import 'package:flutter/material.dart';
//import 'package:flutter/cupertino.dart';
//import 'package:image_picker/image_picker.dart';

//import '../all_style.dart';

class ImageWidget extends StatelessWidget {
  final File image;
  //final ValueChanged<ImageSource> onClicked;
  final VoidCallback onClicked;

  const ImageWidget({
    Key? key,
    required this.image,
    required this.onClicked,
  }) : super(key: key);

  @override
  // Widget build(BuildContext context) {
  //   final color = Theme.of(context).colorScheme.primary;
  //   return Center(
  //     child: Stack(
  //       children: [
  //         buildImage(context),
  //         Positioned(
  //           bottom: 0,
  //           right: 4,
  //           child: buildEditIcon(color),
  //         ),
  //       ]
  //     )
  //   );
  // }
  Widget build(BuildContext context) {
    //final color = Theme.of(context).colorScheme.primary;
    return Center(
      child: buildImage(context),
    );
  }

  Widget buildImage(BuildContext context) {
    // final imagePath = this.image.path;
    // final image = imagePath.contains('https://')
    // ? NetworkImage(imagePath)
    // : FileImage(File(imagePath));
    // return ClipOval(
    //   child: Material(
    //     color: Colors.transparent,
    //     child: Ink.image(
    //       image: image as ImageProvider,
    //       fit: BoxFit.cover,
    //       width: 160,
    //       height: 160,
    //       child: InkWell(
    //         onTap: () async {
    //           final source = await showImageSource(context);
    //           if(source == null) return;

    //           onClicked(source);
    //         },
    //       ),
    //     ),
    //   ),
    // );
    final imagePath = this.image.path;
    final image = NetworkImage(imagePath);
    return Ink.image(
      image: image,
      fit: BoxFit.cover,
      width: 160,
      height: 160,
      child: InkWell(
        onTap: onClicked,
      ),
    );
  }

  // Widget buildEditIcon(Color color) => buildCircle(){

  // }
}
