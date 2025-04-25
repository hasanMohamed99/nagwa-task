import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nagwa_task/features/home/home_feature.dart';
import 'package:nagwa_task/core/core.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.transparent,
        toolbarHeight: 0,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: AppConstants.kVerticalPadding10,
              horizontal: AppConstants.kHorizontalPadding10,
            ),
            child: CustomSearchBar(),
          ),
        ),
        elevation: 0,
      ),
      body: MasonryGridView.builder(
        gridDelegate: const SliverSimpleGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 300),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        padding: const EdgeInsets.only(
          right: AppConstants.kHorizontalPadding10,
          left: AppConstants.kHorizontalPadding10,
          bottom: AppConstants.kVerticalPadding10,
        ),
        itemCount: 30,
        itemBuilder: (context, index) {
          return BookCardWidget(
            bookItemModel: BookItemModel(
              id: 0,
              title: 'Sample Title',
              authors: [Author(name: 'Hasan Mohamed Ibrahim')],
              summaries: [
                'Sample summary of the book goes here. It can be a long text that describes the content of the book in detail.',
              ],
              formats: Formats(
                imageLink: 'https://www.gutenberg.org/cache/epub/45/pg45.cover.medium.jpg',
              ),
            ),
          );
        },
      ),
    );
  }
}
