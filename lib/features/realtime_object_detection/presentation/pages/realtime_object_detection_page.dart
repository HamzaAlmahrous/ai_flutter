// ignore_for_file: unnecessary_null_comparison, constant_identifier_names

import 'package:flutter/material.dart';
import '../widgets/stats_row_widget.dart';
import '/core/util/themes.dart';

import '../../../../core/ml/realtime_object_detection_classifier/recognition.dart';
import '../../../../core/ml/realtime_object_detection_classifier/stats.dart';
import '../widgets/camera_view.dart';
import '../widgets/camera_view_singleton.dart';
import '../widgets/object_box_widget.dart';

// ignore: must_be_immutable
class RealTimeObjectDetectionPage extends StatefulWidget {
  const RealTimeObjectDetectionPage({super.key});

  static const String routeName = 'RealTimeObjectDetectionHomePage';

  @override
  State<RealTimeObjectDetectionPage> createState() => _RealTimeObjectDetectionPageState();

  static const BOTTOM_SHEET_RADIUS = Radius.circular(24.0);
  static const BORDER_RADIUS_BOTTOM_SHEET = BorderRadius.only(topLeft: BOTTOM_SHEET_RADIUS, topRight: BOTTOM_SHEET_RADIUS);
}

class _RealTimeObjectDetectionPageState extends State<RealTimeObjectDetectionPage> {

  /// Results to draw bounding boxes
  List<Recognition>? results;

  /// Realtime stats
  Stats? stats;

  /// Scaffold Key
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Stack(
        children: [
          CameraView(resultsCallback, statsCallback),
          boundingBoxes(results),
          Align(
            alignment: Alignment.bottomCenter,
            child: DraggableScrollableSheet(
              initialChildSize: 0.4,
              minChildSize: 0.1,
              maxChildSize: 0.5,
              builder: (_, ScrollController scrollController) => Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: aiDarkPurple.withOpacity(0.9),
                    borderRadius: RealTimeObjectDetectionPage.BORDER_RADIUS_BOTTOM_SHEET),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.keyboard_arrow_up,size: 48, color: aiPurple),
                        (stats != null)
                            ? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    StatsRow('Inference time:','${stats!.inferenceTime} ms'),
                                    StatsRow('Total prediction time:','${stats!.totalElapsedTime} ms'),
                                    StatsRow('Pre-processing time:','${stats!.preProcessingTime} ms'),
                                    StatsRow('Frame','${CameraViewSingleton.inputImageSize?.width} X ${CameraViewSingleton.inputImageSize?.height}'),
                                  ],
                                ),
                              )
                            : Container()
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  /// Returns Stack of bounding boxes
  Widget boundingBoxes(List<Recognition>? results) {
    if (results == null) {
      return Container();
    }
    return Stack(
      children: results.map((e) => BoxWidget(result: e)).toList(),
    );
  }

  /// Callback to get inference results from [CameraView]
  void resultsCallback(List<Recognition> results) {
    setState(() {
      this.results = results;
    });
  }

  /// Callback to get inference stats from [CameraView]
  void statsCallback(Stats stats) {
    setState(() {
      this.stats = stats;
    });
  }
}

