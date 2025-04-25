import 'package:flutter/foundation.dart';
import 'package:nagwa_task/features/home/home_feature.dart';
import 'package:nagwa_task/core/core.dart';

part 'home_state.dart';

class HomeCubit extends BaseCubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(const HomeState(status: HomeStatus.initial));

  void getBooksList({int? page}) async {
    emit(state.copyWith(status: HomeStatus.loading));
    final response = await _homeRepo.getBooksList(page: page ?? 1);
    switch (response) {
      case Success():
        emit(state.copyWith(status: HomeStatus.success, books: response.data.books));
      case Failure():
        emit(state.copyWith(status: HomeStatus.error, errorMessage: response.error.message));
    }
  }
}
