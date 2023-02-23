import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tmdb_project/core/error/failure.dart';

abstract class UseCase<Type, Parameters> {
  Future<Either<Failure, Type>> call({required Parameters parameters});
}

class NoParameters extends Equatable {
  const NoParameters();
  @override
  List<Object> get props => [];
}