import 'package:flutter/material.dart';

class TextDetectorCard extends StatelessWidget {
  const TextDetectorCard({
    Key? key,
    required this.height,
    required this.width,
    required this.color,
    required this.text,
  }) : super(key: key);

  final double height;
  final double width;
  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(15.0),
      height: height * 0.2,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadiusDirectional.circular(12.0),
        boxShadow: [
          BoxShadow(
              color: color.withOpacity(0.16), blurRadius: 8, spreadRadius: 8)
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            text,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Colors.white),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Text(
                color == Colors.red ? "NEGATIVE" : "POSITIVE",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
