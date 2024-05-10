
import 'package:books/Features/home/domain/entities/book_entity.dart';
import 'package:books/Features/home/domain/repos/home_repo.dart';
import 'package:books/core/errors/failure.dart';
import 'package:books/core/use_cases/use_case.dart';
import 'package:dartz/dartz.dart';




class BestSellerUseCase extends UseCases<List<BookEntity>>
{
  final HomeRepo homeRepo;

  BestSellerUseCase({required this.homeRepo});


  @override
  Future<Either<Failure, List<BookEntity>>> call() async {

    return await homeRepo.fetchBestSellerBooks();
  }



}