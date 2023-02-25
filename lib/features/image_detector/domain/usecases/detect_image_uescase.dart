import 'package:equatable/equatable.dart';
import '/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import '/core/usecase/usecase.dart';
import '/features/image_detector/domain/repository/image_detector_repository.dart';

class DetectImage extends UseCase<String, DetectImageParams>{
  final ImageDetectorRepository imageDetectorRepository;
  DetectImage({required this.imageDetectorRepository});

  @override
  Future<Either<Failure, String>> call({required DetectImageParams parameters}) async{
    return await imageDetectorRepository.detectImage(imagePath: parameters.imagePath);
  }
}

class DetectImageParams extends Equatable {
  final String imagePath;

  const DetectImageParams({required this.imagePath});

  @override
  List<Object?> get props => [imagePath];
}