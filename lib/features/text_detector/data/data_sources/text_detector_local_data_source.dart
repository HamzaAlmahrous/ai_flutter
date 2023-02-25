import '/core/ML/text_classifier/classifier.dart';

abstract class TextDetectorLocalDataSource {
  Future<int> detectTextPositivity({required String text});
}

class TextDetectorLocalDataSourceImpl extends TextDetectorLocalDataSource{
  final Classifier classifier;

  TextDetectorLocalDataSourceImpl({required this.classifier});

  @override
  Future<int> detectTextPositivity({required String text}) async{
    if(classifier.classify(text)[1] > classifier.classify(text)[0]){
      return 1;
    }
    else{
      return 0;
    }
  }
}