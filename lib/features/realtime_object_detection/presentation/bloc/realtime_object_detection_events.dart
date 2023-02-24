import 'package:equatable/equatable.dart';

abstract class RealTimeObjectDetectionEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class DetectObjectEvent extends RealTimeObjectDetectionEvent {
  
  final String imagePath;
  DetectObjectEvent({required this.imagePath});
  @override
  List<Object> get props => [imagePath];
}
