import 'package:flutter/material.dart';

import '../../../../core/util/themes.dart';

class ImageResultWidget extends StatelessWidget {
  const ImageResultWidget({
    Key? key,
    required this.height,
    required this.width,
    required this.text,
  }) : super(key: key);

  final double height;
  final double width;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.all(15.0),
        height: height * 0.1,
        width: width,
        decoration: BoxDecoration(
          color: aiGrey,
          borderRadius: BorderRadiusDirectional.circular(12.0),
          boxShadow: [
            BoxShadow(
                color: aiGrey.withOpacity(0.16),
                blurRadius: 8,
                spreadRadius: 8)
          ],
        ),
        child: Center(
          child: Text(
            text.toUpperCase(),
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      );
  }
}
