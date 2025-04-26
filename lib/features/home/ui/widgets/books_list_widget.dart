import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nagwa_task/features/home/home_feature.dart';
import 'package:nagwa_task/core/core.dart';
import 'package:flutter/material.dart';

class BooksListWidget extends StatelessWidget {
  /// A list of [BookItemModel] to be displayed in a masonry grid view.
  final List<BookItemModel> books;

  /// A boolean value indicating whether the list can be scrolled.
  final bool canScroll;
  const BooksListWidget({super.key, required this.books, this.canScroll = true});

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.builder(
      gridDelegate: const SliverSimpleGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 300),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      physics:
          canScroll ? const AlwaysScrollableScrollPhysics() : const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.only(
        right: AppConstants.kHorizontalPadding10,
        left: AppConstants.kHorizontalPadding10,
        bottom: AppConstants.kVerticalPadding10,
      ),
      itemCount: books.length,
      itemBuilder: (context, index) {
        return BookCardWidget(bookItemModel: books[index]);
      },
    );
  }
}
