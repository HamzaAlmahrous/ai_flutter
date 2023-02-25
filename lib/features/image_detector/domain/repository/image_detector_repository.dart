import 'package:dartz/dartz.dart';
import '/core/error/failure.dart';

abstract class ImageDetectorRepository {
  Future<Either<Failure, String>> detectImage({required String imagePath});
}