import 'package:equatable/equatable.dart';

class TextDetectorState extends Equatable{
  @override
  List<Object?> get props => [];
}

class TextDetectorInitialState extends TextDetectorState {}

//detect text

class DetectTextPositivityLoadingState extends TextDetectorState {}

class DetectTextPositivitySuccessState extends TextDetectorState {
  final int result;
  final String rawText;
  DetectTextPositivitySuccessState({required this.result, required this.rawText});
  
  @override
  List<Object> get props => [result, rawText];
}

class DetectTextPositivityErrorState extends TextDetectorState {

  final String message;
  DetectTextPositivityErrorState({required this.message});
  
  @override
  List<Object> get props => [message];
}