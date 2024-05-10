import 'package:books/Features/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

void SaveBooksData(List<BookEntity> books, String boxName) {
  var box = Hive.box<BookEntity>(boxName);
  box.addAll(books);
}
