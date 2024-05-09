import 'package:books/Features/home/data/repos/home_repo_impl.dart';
import 'package:books/Features/home/domain/entities/book_entity.dart';
import 'package:books/Features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:books/Features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:books/Features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:books/Features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:books/Features/splash/peresntation/views/splash_view.dart';
import 'package:books/constants.dart';
import 'package:books/core/utils/app_router.dart';
import 'package:books/core/utils/fucnctions/setup_service_locator.dart';
import 'package:books/core/utils/simple_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/adapters.dart';
  
  
void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(BookEntityAdapter());
  setUpServiceLocator();
  await Hive.openBox<BookEntity>(kFeaturedBox);
  await Hive.openBox<BookEntity>(kNewestBox);
  Bloc.observer = SimpleBlocObserver();
  runApp(const Books());
}

class Books extends StatelessWidget {
  const Books({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return FeaturedBooksCubit(
              FetchFeaturedBooksUseCase(
                getIt.get<HomeRepoImpl>(),
                getIt.get<HomeRepoImpl>(),
              ),
            );
          },
        ),
        BlocProvider(
          create: (context) {
            return NewestBooksCubit(
              FetchNewestBooksUseCase(
                  getIt.get<HomeRepoImpl>(), getIt.get<HomeRepoImpl>()),
            );
          },
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
        ),
      ),
    );
  }
}

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
  ],
);
