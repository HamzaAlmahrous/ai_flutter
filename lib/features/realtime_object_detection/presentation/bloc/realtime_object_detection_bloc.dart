import 'package:flutter_bloc/flutter_bloc.dart';
import '/features/realtime_object_detection/presentation/bloc/realtime_object_detection_events.dart';

import 'realtime_object_detection_states.dart';

class ObjectDetectorBloc extends Bloc<RealTimeObjectDetectionEvent, ObjectDetectorState> {
  

  ObjectDetectorBloc() : super(ObjectDetectorInitialState()) {
    on<DetectObjectEvent>((event, emit) async {
      
    });
  }
}
