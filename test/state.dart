
import 'package:flutter_test/flutter_test.dart';
import 'package:yaho_coding_challenge/list_users/enum/view_status.dart';

void main() {
  group('ViewStatusX ', () {
    test('returns correct values for ViewStatus.isInitial', () {
      const status = ViewStatus.initial;
      expect(status.isInitial, isTrue);
      expect(status.isRefreshing, isFalse);
      expect(status.isLoadingMore, isFalse);
      expect(status.isSuccess, isFalse);
      expect(status.isEmptyData, isFalse);
      expect(status.isNoMoreData, isFalse);
      expect(status.isError, isFalse);
    });

    test('returns correct values for ViewStatus.isRefreshing', () {
      const status = ViewStatus.refreshing;
      expect(status.isInitial, isFalse);
      expect(status.isRefreshing, isTrue);
      expect(status.isLoadingMore, isFalse);
      expect(status.isSuccess, isFalse);
      expect(status.isEmptyData, isFalse);
      expect(status.isNoMoreData, isFalse);
      expect(status.isError, isFalse);
    });

    test('returns correct values for ViewStatus.isLoadingMore', () {
      const status = ViewStatus.loadingMore;
      expect(status.isInitial, isFalse);
      expect(status.isRefreshing, isFalse);
      expect(status.isLoadingMore, isTrue);
      expect(status.isSuccess, isFalse);
      expect(status.isEmptyData, isFalse);
      expect(status.isNoMoreData, isFalse);
      expect(status.isError, isFalse);
    });

    test('returns correct values for ViewStatus.isSuccess', () {
      const status = ViewStatus.success;
      expect(status.isInitial, isFalse);
      expect(status.isRefreshing, isFalse);
      expect(status.isLoadingMore, isFalse);
      expect(status.isSuccess, isTrue);
      expect(status.isEmptyData, isFalse);
      expect(status.isNoMoreData, isFalse);
      expect(status.isError, isFalse);
    });

    test('returns correct values for ViewStatus.isEmptyData', () {
      const status = ViewStatus.emptyData;
      expect(status.isInitial, isFalse);
      expect(status.isRefreshing, isFalse);
      expect(status.isLoadingMore, isFalse);
      expect(status.isSuccess, isFalse);
      expect(status.isEmptyData, isTrue);
      expect(status.isNoMoreData, isFalse);
      expect(status.isError, isFalse);
    });

    test('returns correct values for ViewStatus.isNoMoreData', () {
      const status = ViewStatus.noMoreData;
      expect(status.isInitial, isFalse);
      expect(status.isRefreshing, isFalse);
      expect(status.isLoadingMore, isFalse);
      expect(status.isSuccess, isFalse);
      expect(status.isEmptyData, isFalse);
      expect(status.isNoMoreData, isTrue);
      expect(status.isError, isFalse);
    });

    test('returns correct values for ViewStatus.isError', () {
      const status = ViewStatus.error;
      expect(status.isInitial, isFalse);
      expect(status.isRefreshing, isFalse);
      expect(status.isLoadingMore, isFalse);
      expect(status.isSuccess, isFalse);
      expect(status.isEmptyData, isFalse);
      expect(status.isNoMoreData, isFalse);
      expect(status.isError, isTrue);
    });
  });
}