import '/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import '/features/text_detector/data/data_sources/text_detector_local_data_source.dart';
import '/features/text_detector/domain/repository/text_detector_repository.dart';

class TextDetectorRepositoryImpl extends TextDetectorRepository{
  final TextDetectorLocalDataSource textDetectorLocalDataSource;

  TextDetectorRepositoryImpl({required this.textDetectorLocalDataSource});

  @override
  Future<Either<Failure, int>> detectTextPositivity({required String text}) async{
    final result = await textDetectorLocalDataSource.detectTextPositivity(text: text);
    try {
      return Right(result);
    } on Exception catch(e) {
      return Left(Failure(message: e.toString()));
    }
  }  

}