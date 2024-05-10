import 'package:books/Features/home/data/repos/home_repo_implementation.dart';
import 'package:books/Features/home/domain/entities/book_entity.dart';
import 'package:books/Features/home/domain/use_cases/featured_books_use_case.dart';
import 'package:books/Features/home/presentation/manager/cubits/best_seller_cubit/best_seller_books_cubit.dart';
import 'package:books/Features/home/presentation/manager/cubits/featured_books_cubit/featured_books_cubit.dart';
import 'package:books/core/constants.dart';
import 'package:books/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';

import 'Features/home/domain/use_cases/best_seller_use_case.dart';
import 'core/functions/getit_service_locator.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox<BookEntity>(kFeaturedBox);
  await Hive.openBox<BookEntity>(kBestsellerbooks);
  runApp(const Books());
}

class Books extends StatelessWidget {
  const Books({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => FeaturedBooksCubit(FetchFeaturedBooksUseCase(
                  homeRepo: locator.get<HomeRepoImplementation>(),
                ))),
        BlocProvider(
            create: (context) => BestSellerBooksCubit(BestSellerUseCase(
                  homeRepo: locator.get<HomeRepoImplementation>(),
                )))
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}
