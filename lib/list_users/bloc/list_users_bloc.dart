import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yaho_coding_challenge/list_users/enum/view_status.dart';
import 'package:yaho_coding_challenge/list_users/bloc/list_users_event.dart';

import '../../repository/list_user_repository.dart';
import '../enum/view_mode.dart';
import 'list_users_state.dart';

class ListUsersBloc extends Bloc<ListUsersEvent, ListUsersState> {
  ListUsersBloc({required this.repository}) : super(ListUsersState()) {
    on<LoadFirstPageData>(loadFirstPageData);
    on<LoadMoreData>(loadMoreData);
    on<ChangeViewMode>(changeViewMode);
  }

  final ListUsersRepository repository;

  void addLoadFirstPageData() => add(LoadFirstPageData());

  void addLoadMoreData(int pageIndex) => add(LoadMoreData(pageIndex));

  void addChangeViewMode(ViewMode viewMode) => add(ChangeViewMode(viewMode));

  Future<void> loadFirstPageData(
      LoadFirstPageData event, Emitter<ListUsersState> emit) async {
    print('ListUsersBloc - loadFirstPageData');
    try {
      emit(state.copyWith(status: ViewStatus.refreshing));
      var rs = await repository.getListUsersData(1);
      final newState = state.copyWith(
          listUsersModel: rs,
          status: rs.total == 0 ? ViewStatus.emptyData : ViewStatus.success);
      emit(newState);
    } catch (ex) {
      print(ex.toString());
      emit(state.copyWith(status: ViewStatus.error));
    }
  }

  Future<void> loadMoreData(
      LoadMoreData event, Emitter<ListUsersState> emit) async {
    print('ListUsersBloc - loadMoreData');
    if (state.canLoadMore()) {
      try {
        //show loading
        emit(state.copyWith(status: ViewStatus.loadingMore));
        //get next page data
        var newPageData =
            await repository.getListUsersData(event.pageIndex + 1);
        //check data conditions
        if (newPageData.data!.isNotEmpty) {
          //add new array data to list
          state.listUsersModel.data!.addAll(newPageData.data!);
          final newListUserModel = state.listUsersModel.copyWith(
              page: newPageData.page,
              perPage: newPageData.perPage,
              total: newPageData.total,
              totalPages: newPageData.totalPages,
              support: newPageData.support);
          //update new state
          emit(state.copyWith(
              listUsersModel: newListUserModel,
              status: state.listUsersModel.total == 0
                  ? ViewStatus.emptyData
                  : ViewStatus.success));
        } else {
          //new data is empty
          emit(state.copyWith(status: ViewStatus.success));
        }
      } catch (ex) {
        print(ex.toString());
        emit(state.copyWith(status: ViewStatus.error));
      }
    } else {
      //show no more data
      emit(state.copyWith(status: ViewStatus.noMoreData));
    }
  }

  void changeViewMode(ChangeViewMode event, Emitter<ListUsersState> emit) {
    print('ListUsersBloc - changeViewMode');
    emit(state.copyWith(viewMode: event.viewMode));
  }
}
