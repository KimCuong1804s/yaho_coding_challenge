import 'package:flutter/material.dart';
import 'package:yaho_coding_challenge/list_users/widgets/data_grid_view.dart';
import 'package:yaho_coding_challenge/list_users/widgets/data_list_view.dart';

enum ViewMode { listView, gridView }

extension ViewModeX on ViewMode {
  bool get isListView => this == ViewMode.listView;

  bool get isGridView => this == ViewMode.gridView;

  ViewMode get otherViewMode =>
      isListView ? ViewMode.gridView : ViewMode.listView;

  Widget get viewWidget =>
      isListView ? const DataListView() : const DataGridView();

  Icon get iconButton =>
      Icon(isGridView ? Icons.grid_view : Icons.format_list_bulleted);
}
