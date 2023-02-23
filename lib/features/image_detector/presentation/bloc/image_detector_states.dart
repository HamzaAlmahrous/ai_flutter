import 'package:equatable/equatable.dart';

class ImageDetectorState extends Equatable{
  @override
  List<Object?> get props => [];
}

class ImageDetectorInitialState extends ImageDetectorState {}

//detect image

class DetectImageLoadingState extends ImageDetectorState {}

class DetectImageSuccessState extends ImageDetectorState {
  final String result;
  DetectImageSuccessState({required this.result});
  
  @override
  List<Object> get props => [result];
}

class DetectImageErrorState extends ImageDetectorState {

  final String message;
  DetectImageErrorState({required this.message});
  
  @override
  List<Object> get props => [message];
}