part of 'home_cubit.dart';

enum HomeStatus { initial, loading, success, error, paginatedLoading }

extension Status on HomeState {
  bool get isInitial => status == HomeStatus.initial;
  bool get isLoading => status == HomeStatus.loading;
  bool get isSuccess => status == HomeStatus.success;
  bool get isError => status == HomeStatus.error;
  bool get isPaginatedLoading => status == HomeStatus.paginatedLoading;
}

class HomeState {
  final HomeStatus status;
  final List<BookItemModel>? books;
  final String? errorMessage;
  final int currentPage;
  final bool isLoadingMore;
  final String? searchQuery;
  final bool? isLastPage;

  const HomeState({
    required this.status,
    this.books,
    this.errorMessage,
    this.currentPage = 1,
    this.isLoadingMore = false,
    this.searchQuery,
    this.isLastPage,
  });

  HomeState copyWith({
    HomeStatus? status,
    List<BookItemModel>? books,
    String? errorMessage,
    int? currentPage,
    bool? isLoadingMore,
    String? searchQuery,
    bool? isLastPage,
  }) {
    return HomeState(
      status: status ?? this.status,
      books: books ?? this.books,
      errorMessage: errorMessage ?? this.errorMessage,
      currentPage: currentPage ?? this.currentPage,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      searchQuery: searchQuery ?? this.searchQuery,
      isLastPage: isLastPage ?? this.isLastPage,
    );
  }

  @override
  String toString() {
    return 'HomeState{status: $status, booksModelResponse: $books, '
        'errorMessage: $errorMessage, currentPage: $currentPage, '
        'isLoadingMore: $isLoadingMore, searchQuery: $searchQuery, '
        'isLastPage: $isLastPage';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is HomeState &&
        other.status == status &&
        listEquals(other.books, books) &&
        other.errorMessage == errorMessage &&
        other.currentPage == currentPage &&
        other.isLoadingMore == isLoadingMore &&
        other.searchQuery == searchQuery &&
        other.isLastPage == isLastPage;
  }

  @override
  int get hashCode =>
      status.hashCode ^
      books.hashCode ^
      errorMessage.hashCode ^
      currentPage.hashCode ^
      isLoadingMore.hashCode ^
      searchQuery.hashCode ^
      isLastPage.hashCode;
}
