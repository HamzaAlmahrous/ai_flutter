import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '/core/util/themes.dart';
import '/features/image_detector/presentation/bloc/image_detector_bloc.dart';
import '/features/image_detector/presentation/bloc/image_detector_events.dart';
import '/features/image_detector/presentation/bloc/image_detector_states.dart';
import '/core/services/service_locator.dart';

import '../widgets/image_result_widget.dart';
import '../widgets/image_show_widget.dart';

// ignore: must_be_immutable
class ImageClassifierPage extends StatelessWidget {
  ImageClassifierPage({super.key});

  late double height;
  late double width;
  File? image;
  Image? imageWidget;
  final picker = ImagePicker();

  static const String routeName = 'ImageClassifierHomePage';

  Future getImage(context) async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      imageWidget = Image.file(image!);
      BlocProvider.of<ImageDetectorBloc>(context)
          .add(DetectImageEvent(imagePath: pickedFile.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, BoxConstraints constraints) {
      height = constraints.maxHeight;
      width = constraints.maxWidth;
      return BlocProvider(
        create: (BuildContext context) => sl<ImageDetectorBloc>(),
        child: BlocBuilder<ImageDetectorBloc, ImageDetectorState>(
            builder: (context, state) {
          return Column(
            children: [
              Container(
                height: height / 2,
                width: width,
                margin: const EdgeInsets.all(18.0),
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                        color: aiPurple.withOpacity(0.16),
                        blurRadius: 8,
                        spreadRadius: 8)
                  ],
                  color: aiPurple.withOpacity(0.8),
                ),
                child: state is DetectImageLoadingState
                    ? const CircularProgressIndicator()
                    : image != null
                        ? ImageShowWidget(image: image)
                        : Container(),
              ),
              state is DetectImageSuccessState
                  ? ImageResultWidget(height: height, width: width, text: state.result)
                  : Container(),
              const Spacer(),
              Container(
                margin: const EdgeInsets.all(18.0),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: FloatingActionButton(
                      child: const Icon(Icons.add_photo_alternate_outlined,
                          size: 30.0),
                      onPressed: () {
                        getImage(context);
                      }),
                ),
              ),
            ],
          );
        }),
      );
    });
  }
}

