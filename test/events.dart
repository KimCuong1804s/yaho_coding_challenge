
import 'package:flutter_test/flutter_test.dart';
import 'package:yaho_coding_challenge/list_users/enum/view_mode.dart';
import 'package:yaho_coding_challenge/list_users/bloc/list_users_event.dart';

void main() {
  group('ListUsersEvent', () {

    test('LoadFirstPageData', () {
      expect(ListUsersEvent(), ListUsersEvent());
    });

    test('LoadFirstPageData', () {
      expect(LoadFirstPageData(), LoadFirstPageData());
    });

    test('ChangeViewMode', () {
      expect(ChangeViewMode(ViewMode.listView), ChangeViewMode(ViewMode.listView));
    });

    test('LoadMoreData', () {
      expect(
        LoadMoreData(2),
        LoadMoreData(2),
      );
    });
  });
}