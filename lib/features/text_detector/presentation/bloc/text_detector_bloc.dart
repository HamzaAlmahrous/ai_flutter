import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_project/features/text_detector/domain/usecases/detect_text_uescase.dart';
import 'package:tmdb_project/features/text_detector/presentation/bloc/text_detector_events.dart';
import 'package:tmdb_project/features/text_detector/presentation/bloc/text_detector_states.dart';

class TextDetectorBloc extends Bloc<TextDetectorEvent, TextDetectorState> {
  
  final DetectTextPositivity detectTextPositivity;

  TextDetectorBloc({required this.detectTextPositivity})
      : super(TextDetectorInitialState()) {
    on<TextDetectorEvent>((event, emit) async {
      if (event is DetectTextPositivityEvent) {
        emit(DetectTextPositivityLoadingState());
        var failureOrGetTextDetectors = await detectTextPositivity(
            parameters: DetectTextParams(text: event.text));
        await failureOrGetTextDetectors.fold((failure) async {
          emit(DetectTextPositivityErrorState(message: failure.message));
        }, (result) async {
          emit(DetectTextPositivitySuccessState(result: result, rawText: event.text));
        });
      }
    });
  }
}
