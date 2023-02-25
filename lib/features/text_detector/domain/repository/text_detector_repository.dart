import 'package:dartz/dartz.dart';
import '/core/error/failure.dart';

abstract class TextDetectorRepository {
  Future<Either<Failure, int>> detectTextPositivity({required String text});
}