import '/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import '/features/image_detector/domain/repository/image_detector_repository.dart';
import '../data_sources/image_detector_local_data_source.dart';


class ImageDetectorRepositoryImpl extends ImageDetectorRepository{
  final ImageDetectorLocalDataSource imageDetectorLocalDataSource;

  ImageDetectorRepositoryImpl({required this.imageDetectorLocalDataSource});

  @override
  Future<Either<Failure, String>> detectImage({required String imagePath}) async{
    final result = await imageDetectorLocalDataSource.detectImage(imagePath: imagePath);
    try {
      return Right(result);
    } on Exception catch(e) {
      return Left(Failure(message: e.toString()));
    }
  }  

}