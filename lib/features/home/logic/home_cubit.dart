import 'package:nagwa_task/features/home/home_feature.dart';
import 'package:nagwa_task/core/core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

part 'home_state.dart';

class HomeCubit extends BaseCubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(const HomeState(status: HomeStatus.initial));

  /// Get the books list from the API and support pagination.
  void getBooksList({bool isFromLoading = false}) async {
    if (state.isLastPage == true) return;
    if (isFromLoading) {
      emit(
        state.copyWith(
          status: HomeStatus.paginatedLoading,
          books: state.books,
          isLoadingMore: true,
        ),
      );
    } else {
      emit(state.copyWith(status: HomeStatus.loading));
    }
    final response = await _homeRepo.getBooksList(page: state.currentPage);

    switch (response) {
      case Success():
        emit(
          state.copyWith(
            status: HomeStatus.success,
            books:
                state.books == null
                    ? response.data.books
                    : [...state.books!, ...response.data.books],
            currentPage: state.currentPage + 1,
            isLoadingMore: false,
            isLastPage: response.data.next == null,
          ),
        );
      case Failure():
        emit(
          state.copyWith(
            status: HomeStatus.error,
            errorMessage: response.error.message,
            isLoadingMore: false,
          ),
        );
    }
  }

  /// Refresh the books list and clear the search query and clear the state cache.
  void refreshBooksList() async {
    searchController.clear();
    emit(const HomeState(status: HomeStatus.loading));
    getBooksList();
  }

  /// A debBouncer to prevent multiple API calls when the user types in the search bar.
  final deBouncer = DeBouncer(milliseconds: 1000);

  /// A controller for the search bar.
  final TextEditingController searchController = TextEditingController();

  /// Run a search query to get books based on the search query.
  void runSearchQuery(String query, {bool isFromLoading = false}) async {
    if (state.isLastPage == true) return;
    if (isFromLoading) {
      emit(
        state.copyWith(
          status: HomeStatus.paginatedLoading,
          books: state.books,
          isLoadingMore: true,
          searchQuery: query,
        ),
      );
    } else {
      emit(
        state.copyWith(status: HomeStatus.loading, searchQuery: query, books: [], currentPage: 1),
      );
    }

    final response = await _homeRepo.getBooksList(page: state.currentPage, query: query);
    switch (response) {
      case Success():
        emit(
          state.copyWith(
            status: HomeStatus.success,
            books:
                state.books == null
                    ? response.data.books
                    : [...state.books!, ...response.data.books],
            currentPage: state.currentPage + 1,
            isLoadingMore: false,
            isLastPage: response.data.next == null,
          ),
        );
      case Failure():
        emit(
          state.copyWith(
            status: HomeStatus.error,
            errorMessage: response.error.message,
            isLoadingMore: false,
          ),
        );
    }
  }

  /// Clear the search state and reset the search query.
  void clearSearchState() {
    emit(const HomeState(status: HomeStatus.initial));
  }
}
