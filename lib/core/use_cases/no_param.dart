import 'package:books/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase <Type>{
  Future<Either<Failure,Type>> call();
}

class NoParam{}