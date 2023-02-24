import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RealTimeObjectDetectionPage extends StatelessWidget {
  RealTimeObjectDetectionPage({super.key});

  late double height;
  late double width;

  static const String routeName = 'RealTimeObjectDetectionHomePage';


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, BoxConstraints constraints) {
      height = constraints.maxHeight;
      width = constraints.maxWidth;
      return const Center(child: Text("RealTimeObjectDetection"));
    });
  }
}

