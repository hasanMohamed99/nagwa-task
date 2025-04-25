part of 'home_cubit.dart';

enum HomeStatus { initial, loading, success, error }

extension Status on HomeState {
  bool get isInitial => status == HomeStatus.initial;
  bool get isLoading => status == HomeStatus.loading;
  bool get isSuccess => status == HomeStatus.success;
  bool get isError => status == HomeStatus.error;
}

class HomeState {
  final HomeStatus status;
  final List<BookItemModel>? books;
  final String? errorMessage;

  const HomeState({required this.status, this.books, this.errorMessage});

  HomeState copyWith({HomeStatus? status, List<BookItemModel>? books, String? errorMessage}) {
    return HomeState(
      status: status ?? this.status,
      books: books ?? this.books,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  String toString() {
    return 'HomeState{status: $status, booksModelResponse: $books, errorMessage: $errorMessage}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is HomeState &&
        other.status == status &&
        listEquals(other.books, books) &&
        other.errorMessage == errorMessage;
  }

  @override
  int get hashCode => status.hashCode ^ books.hashCode ^ errorMessage.hashCode;
}
