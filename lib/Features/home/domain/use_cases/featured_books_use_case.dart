
import 'package:books/Features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/use_cases/use_case.dart';
import '../entities/book_entity.dart';



class FetchFeaturedBooksUseCase extends UseCases<List<BookEntity>> {

  final HomeRepo homeRepo;

  FetchFeaturedBooksUseCase({required this.homeRepo});

  @override
  Future<Either<Failure, List<BookEntity>>> call()  async
  {
    return await homeRepo.fetchFeaturedBooks();

  }




}












