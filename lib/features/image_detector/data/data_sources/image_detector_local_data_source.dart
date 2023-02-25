// ignore: depend_on_referenced_packages
import 'package:image/image.dart' as img;
import 'package:tflite_flutter_helper/tflite_flutter_helper.dart';
import 'dart:io';
import '/core/ML/image_classifier/classifier_quant.dart';

abstract class ImageDetectorLocalDataSource {
  Future<String> detectImage({required String imagePath});
}

class ImageDetectorLocalDataSourceImpl extends ImageDetectorLocalDataSource {
  final ClassifierQuant classifier;

  ImageDetectorLocalDataSourceImpl({required this.classifier});

  @override
  Future<String> detectImage({required String imagePath}) async {
    //get the picked file
    File image = File(imagePath);

    //decode it
    img.Image imageInput = img.decodeImage(image.readAsBytesSync())!;
    
    //predict
    var pred = classifier.predict(imageInput);
    Category category = pred;
    
    //return the result
    return category.label;
  }
}
