import 'package:equatable/equatable.dart';

abstract class TextDetectorEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class DetectTextPositivityEvent extends TextDetectorEvent {
  
  final String text;
  DetectTextPositivityEvent({required this.text});
  @override
  List<Object> get props => [text];
}
