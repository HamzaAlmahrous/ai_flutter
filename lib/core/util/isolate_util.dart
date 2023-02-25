// ignore_for_file: depend_on_referenced_packages, constant_identifier_names, unnecessary_null_comparison, unused_field

import 'dart:io';
import 'dart:isolate';
import 'package:camera/camera.dart';
import 'package:image/image.dart' as image_lib;
import 'package:tflite_flutter/tflite_flutter.dart';
import '../ml/realtime_object_detection_classifier/classifier.dart';
import 'image_util.dart';

/// Manages separate Isolate instance for inference
class IsolateUtils {
  static const String DEBUG_NAME = "InferenceIsolate";

  late Isolate _isolate;
  final ReceivePort _receivePort = ReceivePort();
  late SendPort _sendPort;

  SendPort get sendPort => _sendPort;

  Future<void> start() async {
    _isolate = await Isolate.spawn<SendPort>(
      entryPoint,
      _receivePort.sendPort,
      debugName: DEBUG_NAME,
    );

    _sendPort = await _receivePort.first;
  }

  static void entryPoint(SendPort sendPort) async {
    final port = ReceivePort();
    sendPort.send(port.sendPort);

    await for (final IsolateData isolateData in port) {
      if (isolateData != null) {
        Classifier classifier = Classifier(
            interpreter: Interpreter.fromAddress(isolateData.interpreterAddress),
            labels: isolateData.labels);
        image_lib.Image image = ImageUtils.convertCameraImage(isolateData.cameraImage)!;
        if (Platform.isAndroid) {
          image = image_lib.copyRotate(image, 90);
        }
        Map<String, dynamic>? results = classifier.predict(image);
        isolateData.responsePort.send(results);
      }
    }
  }
}

/// Bundles data to pass between Isolate
class IsolateData {
  late CameraImage cameraImage;
  late int interpreterAddress;
  late List<String> labels;
  late SendPort responsePort;

  IsolateData(
    this.cameraImage,
    this.interpreterAddress,
    this.labels,
  );
}