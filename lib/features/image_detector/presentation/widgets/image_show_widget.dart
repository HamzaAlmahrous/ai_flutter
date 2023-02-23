import 'dart:io';

import 'package:flutter/material.dart';

class ImageShowWidget extends StatelessWidget {
  const ImageShowWidget({
    Key? key,
    required this.image,
  }) : super(key: key);

  final File? image;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image(
            image: FileImage(image!), fit: BoxFit.cover));
  }
}

