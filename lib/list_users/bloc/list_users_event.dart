import 'package:equatable/equatable.dart';

import '../enum/view_mode.dart';

class ListUsersEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoadFirstPageData extends ListUsersEvent {}

class ChangeViewMode extends ListUsersEvent {
  ChangeViewMode(this.viewMode);

  final ViewMode viewMode;

  @override
  List<Object?> get props => [viewMode];
}

class LoadMoreData extends ListUsersEvent {
  LoadMoreData(this.pageIndex);

  final int pageIndex;

  @override
  List<Object?> get props => [pageIndex];
}
