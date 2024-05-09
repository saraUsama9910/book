import 'package:books/Features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:books/Features/home/presentation/views/widgets/featured_books_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksListViewBlocBuilder extends StatelessWidget {
  const FeaturedBooksListViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
        builder: (context, state) {
      if (state is FeaturedBooksSuccess) {
        return const FeaturedBooksListView();
      } else if (state is FeaturedBooksFailure) {
        return Text(state.errMessage);
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    });
  }
}