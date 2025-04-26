import 'package:flutter/material.dart';
import 'package:nagwa_task/features/home/home_feature.dart';
import 'package:nagwa_task/core/core.dart';
import 'package:flutter/foundation.dart';

part 'home_state.dart';

class HomeCubit extends BaseCubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(const HomeState(status: HomeStatus.initial));

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

  void refreshBooksList() async {
    searchController.clear();
    emit(const HomeState(status: HomeStatus.loading));

    final response = await _homeRepo.getBooksList(page: 1);

    switch (response) {
      case Success():
        emit(HomeState(status: HomeStatus.success, books: response.data.books));
      case Failure():
        emit(HomeState(status: HomeStatus.error, errorMessage: response.error.message));
    }
  }

  final deBouncer = DeBouncer(milliseconds: 1000);
  final TextEditingController searchController = TextEditingController();
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

  void clearSearchState() {
    emit(const HomeState(status: HomeStatus.initial));
  }
}
