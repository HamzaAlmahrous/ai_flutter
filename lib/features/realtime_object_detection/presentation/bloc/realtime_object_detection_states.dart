import 'package:equatable/equatable.dart';

class ObjectDetectorState extends Equatable{
  @override
  List<Object?> get props => [];
}

class ObjectDetectorInitialState extends ObjectDetectorState {}

//detect Object

class DetectObjectLoadingState extends ObjectDetectorState {}

class DetectObjectSuccessState extends ObjectDetectorState {
  DetectObjectSuccessState();
  
  @override
  List<Object> get props => [];
}

class DetectObjectErrorState extends ObjectDetectorState {

  final String message;
  DetectObjectErrorState({required this.message});
  
  @override
  List<Object> get props => [message];
}