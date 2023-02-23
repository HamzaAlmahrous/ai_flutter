import 'package:equatable/equatable.dart';

abstract class ImageDetectorEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class DetectImageEvent extends ImageDetectorEvent {
  
  final String imagePath;
  DetectImageEvent({required this.imagePath});
  @override
  List<Object> get props => [imagePath];
}
