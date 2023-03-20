enum ViewStatus {
  initial,
  refreshing,
  loadingMore,
  success,
  emptyData,
  noMoreData,
  error,
}

extension ViewStatusX on ViewStatus {
  bool get isInitial => this == ViewStatus.initial;

  bool get isRefreshing => this == ViewStatus.refreshing;

  bool get isSuccess => this == ViewStatus.success;

  bool get isEmptyData => this == ViewStatus.emptyData;

  bool get isError => this == ViewStatus.error;

  bool get isLoadingMore => this == ViewStatus.loadingMore;

  bool get isNoMoreData => this == ViewStatus.noMoreData;
}
