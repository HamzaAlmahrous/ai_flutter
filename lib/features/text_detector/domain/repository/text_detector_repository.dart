import 'package:dartz/dartz.dart';
import 'package:tmdb_project/core/error/failure.dart';

abstract class TextDetectorRepository {
  Future<Either<Failure, int>> detectTextPositivity({required String text});
}