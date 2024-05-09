
import 'package:books/Features/home/data/repos/home_repo_impl.dart';
import 'package:books/Features/home/domain/entities/book_entity.dart';
import 'package:books/Features/home/domain/repos/home_repo.dart';
import 'package:books/core/errors/failure.dart';
import 'package:books/core/use_cases/no_param.dart';
import 'package:dartz/dartz.dart';

class FetchNewestBooksUseCase extends UseCase<List<BookEntity>>{
  final HomeRepo homeRepo;

  FetchNewestBooksUseCase(HomeRepoImpl homeRepoImpl,  this.homeRepo);
  
  @override
  Future<Either<Failure, List<BookEntity>>> call()async {
    throw await homeRepo.fetchNewestBooks();
  }
  
 
  
  
  
  
 
 
}

