import 'package:flutter_bloc/flutter_bloc.dart';
import '/features/image_detector/domain/usecases/detect_image_uescase.dart';
import '/features/image_detector/presentation/bloc/image_detector_events.dart';
import '/features/image_detector/presentation/bloc/image_detector_states.dart';

class ImageDetectorBloc extends Bloc<ImageDetectorEvent, ImageDetectorState> {
  
  final DetectImage detectImage;

  ImageDetectorBloc({required this.detectImage}) : super(ImageDetectorInitialState()) {
    on<ImageDetectorEvent>((event, emit) async {
      if (event is DetectImageEvent) {
        emit(DetectImageLoadingState());
        var failureOrGetImageDetectors = await detectImage(parameters: DetectImageParams(imagePath: event.imagePath));
        await failureOrGetImageDetectors.fold((failure) async {
          emit(DetectImageErrorState(message: failure.message));
        }, (result) async {
          emit(DetectImageSuccessState(result: result));
        });
      }
    });
  }
}
