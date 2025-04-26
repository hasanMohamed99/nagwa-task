import 'package:nagwa_task/features/home/home_feature.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nagwa_task/core/core.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeCubit = context.read<HomeCubit>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.transparent,
        toolbarHeight: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: AppConstants.kVerticalPadding10,
              horizontal: AppConstants.kHorizontalPadding10,
            ),
            child: CustomSearchBar(
              controller: homeCubit.searchController,
              onChanged: (value) {
                homeCubit.deBouncer.run(() {
                  if (value.trim().isNotEmpty) {
                    homeCubit.clearSearchState();
                    homeCubit.runSearchQuery(value);
                  } else {
                    homeCubit.refreshBooksList();
                  }
                });
              },
            ),
          ),
        ),
        elevation: 0,
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification.metrics.pixels == notification.metrics.maxScrollExtent &&
              notification is ScrollUpdateNotification) {
            if (!homeCubit.state.searchQuery.isNullOrEmpty()) {
              homeCubit.runSearchQuery(homeCubit.state.searchQuery!, isFromLoading: true);
            } else {
              homeCubit.getBooksList(isFromLoading: true);
            }
          }
          return true;
        },
        child: RefreshIndicator(
          onRefresh: () async => homeCubit.refreshBooksList(),
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
              return switch (state.status) {
                HomeStatus.loading || HomeStatus.initial => SkeletonizerWidget(
                  child: BooksListWidget(
                    books: List.generate(
                      MediaQuery.of(context).size.width > 600 ? 20 : 10,
                      (index) => BookItemModel(
                        id: 0,
                        title: 'Sample Title',
                        authors: [Author(name: 'Hasan Mohamed Ibrahim')],
                        summaries: [
                          'Sample summary of the book goes here. It can be a long text that describes the content of the book in detail.',
                        ],
                        formats: Formats(imageLink: ''),
                      ),
                    ),
                  ),
                ),
                HomeStatus.error =>
                  !state.books.isNullOrEmpty()
                      ? BooksListWidget(books: state.books!)
                      : Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppConstants.kHorizontalPadding10,
                        ),
                        child: Center(
                          child: Text.rich(
                            TextSpan(
                              text: state.errorMessage ?? '',
                              children: [
                                WidgetSpan(
                                  alignment: PlaceholderAlignment.middle,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: AppConstants.kHorizontalPadding10,
                                    ),
                                    child: TextButton.icon(
                                      style: TextButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            AppConstants.kRadius10,
                                          ),
                                          side: BorderSide(
                                            color: Theme.of(context).colorScheme.primary,
                                          ),
                                        ),
                                      ),
                                      onPressed: homeCubit.refreshBooksList,
                                      label: Text('Retry', style: AppTextStyles.font14Medium),
                                      icon: const Icon(Icons.refresh),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            style: AppTextStyles.font16Medium,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                HomeStatus.success || HomeStatus.paginatedLoading =>
                  state.books.isNullOrEmpty()
                      ? Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppConstants.kHorizontalPadding10,
                        ),
                        child: Center(
                          child: Text('No books found', style: AppTextStyles.font20Bold),
                        ),
                      )
                      : BooksListWidget(books: state.books!, canScroll: !state.isLoadingMore),
              };
            },
          ),
        ),
      ),
      bottomNavigationBar: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return state.status == HomeStatus.paginatedLoading
              ? const FittedBox(
                fit: BoxFit.scaleDown,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: AppConstants.kVerticalPadding10),
                  child: CircularProgressIndicator(),
                ),
              )
              : const SizedBox.shrink();
        },
      ),
    );
  }
}
