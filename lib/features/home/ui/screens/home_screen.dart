import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nagwa_task/features/home/home_feature.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nagwa_task/core/core.dart';
import 'package:flutter/material.dart';

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
      body: RefreshIndicator(
        onRefresh: () async => context.read<HomeCubit>().getBooksList(),
        child: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            if (state.status == HomeStatus.error) {
              showSnackBar(
                context: context,
                title: state.errorMessage ?? '',
                type: SnackBarType.error,
                behavior: SnackBarBehavior.fixed,
              );
            }
          },
          builder: (context, state) {
            switch (state.status) {
              case HomeStatus.loading || HomeStatus.initial:
                return SkeletonizerWidget(
                  child: MasonryGridView.builder(
                    gridDelegate: const SliverSimpleGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 300,
                    ),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    padding: const EdgeInsets.only(
                      right: AppConstants.kHorizontalPadding10,
                      left: AppConstants.kHorizontalPadding10,
                      bottom: AppConstants.kVerticalPadding10,
                    ),
                    itemCount: MediaQuery.of(context).size.width > 600 ? 20 : 10,
                    itemBuilder: (context, index) {
                      return BookCardWidget(
                        bookItemModel: BookItemModel(
                          id: 0,
                          title: 'Sample Title',
                          authors: [Author(name: 'Hasan Mohamed Ibrahim')],
                          summaries: [
                            'Sample summary of the book goes here. It can be a long text that describes the content of the book in detail.',
                          ],
                          formats: Formats(imageLink: ''),
                        ),
                      );
                    },
                  ),
                );

              case HomeStatus.error:
                if (!state.books.isNullOrEmpty()) {
                  return MasonryGridView.builder(
                    gridDelegate: const SliverSimpleGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 300,
                    ),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    padding: const EdgeInsets.only(
                      right: AppConstants.kHorizontalPadding10,
                      left: AppConstants.kHorizontalPadding10,
                      bottom: AppConstants.kVerticalPadding10,
                    ),
                    itemCount: state.books!.length,
                    itemBuilder: (context, index) {
                      return BookCardWidget(bookItemModel: state.books![index]);
                    },
                  );
                }
                return Center(
                  child: Text(state.errorMessage ?? '', style: const TextStyle(fontSize: 20)),
                );

              case HomeStatus.success:
                if (state.books.isNullOrEmpty()) {
                  return const Center(
                    child: Text('No books found', style: TextStyle(fontSize: 20)),
                  );
                }
                return MasonryGridView.builder(
                  gridDelegate: const SliverSimpleGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 300,
                  ),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  padding: const EdgeInsets.only(
                    right: AppConstants.kHorizontalPadding10,
                    left: AppConstants.kHorizontalPadding10,
                    bottom: AppConstants.kVerticalPadding10,
                  ),
                  itemCount: state.books!.length,
                  itemBuilder: (context, index) {
                    return BookCardWidget(bookItemModel: state.books![index]);
                  },
                );
            }
          },
        ),
      ),
    );
  }
}
