import 'package:equatable/equatable.dart';
import '../../repository/models/list_users.dart';
import '../enum/view_status.dart';
import '../enum/view_mode.dart';

class ListUsersState extends Equatable {
  ListUsersState({
    this.viewMode = ViewMode.listView,
    this.status = ViewStatus.initial,
    ListUsersModel? listUsersModel,
  }) : listUsersModel = listUsersModel ?? ListUsersModel();

  final ViewMode viewMode;
  final ListUsersModel listUsersModel;
  final ViewStatus status;

  @override
  // TODO: implement props
  List<Object?> get props => [viewMode, listUsersModel, status];

  ListUsersState copyWith({
    ViewMode? viewMode,
    ViewStatus? status,
    ListUsersModel? listUsersModel,
  }) {
    return ListUsersState(
      viewMode: viewMode ?? this.viewMode,
      status: status ?? this.status,
      listUsersModel: listUsersModel ?? this.listUsersModel,
    );
  }

  bool canLoadMore() {
    if (listUsersModel.total != null) {
      if (listUsersModel.data!.length < listUsersModel.total!) {
        return true;
      }
    }
    return false;
  }
}
