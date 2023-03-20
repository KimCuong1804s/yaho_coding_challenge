import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:yaho_coding_challenge/list_users/bloc/list_users_bloc.dart';
import 'package:yaho_coding_challenge/list_users/bloc/list_users_state.dart';
import 'package:yaho_coding_challenge/list_users/enum/view_mode.dart';
import 'package:yaho_coding_challenge/list_users/enum/view_status.dart';
import 'package:yaho_coding_challenge/list_users/bloc/list_users_event.dart';
import 'package:yaho_coding_challenge/repository/list_user_repository.dart';
import 'package:yaho_coding_challenge/repository/models/exception.dart';
import 'package:yaho_coding_challenge/repository/models/list_users.dart';

class MockRepository extends Mock implements ListUsersRepository {}

class MockListUsers extends Mock implements ListUsersModel {}

void main() {
  late ListUsersRepository listUsersRepository;
  late ListUsersModel mockListUsers;

  group('test bloc', () {
    setUp(() {
      listUsersRepository = MockRepository();
      mockListUsers = MockListUsers();
    });

    test(
      'initial state [ViewStatus.initial]',
      () {
        expect(
          ListUsersBloc(repository: listUsersRepository).state.status.isInitial,
          isTrue,
        );
      },
    );

    test(
      'initial state [ViewMode.listView]',
      () {
        expect(
          ListUsersBloc(repository: listUsersRepository).state.viewMode,
          ViewMode.listView,
        );
      },
    );

    test(
      'ListUsersState copyWith method initial state',
      () {
        expect(
          ListUsersBloc(repository: listUsersRepository).state,
          ListUsersState().copyWith(),
        );
      },
    );

    blocTest<ListUsersBloc, ListUsersState>(
      'emits [ViewStatus.refreshing, ViewStatus.success]'
      ' when repository returns a successful outcome',
      setUp: () {
        when(() => listUsersRepository.getListUsersData(1)).thenAnswer(
          (_) async => mockListUsers,
        );
      },
      build: () => ListUsersBloc(repository: listUsersRepository),
      act: (bloc) => bloc.add(LoadFirstPageData()),
      expect: () => <ListUsersState>[
        ListUsersState(status: ViewStatus.refreshing),
        ListUsersState(
            listUsersModel: mockListUsers,
            status: mockListUsers.total == 0
                ? ViewStatus.emptyData
                : ViewStatus.success),
        // ListUsersState(status: ViewStatus.error)
      ],
      verify: (_) {
        verify(
          () => listUsersRepository.getListUsersData(1),
        ).called(1);
      },
    );

    blocTest<ListUsersBloc, ListUsersState>(
      'emits [ViewStatus.loading]'
          'when repository returns a unsuccessful outcome ',
      setUp: () {
        when(() => listUsersRepository.getListUsersData(1)).thenThrow(
          ErrorEmptyResponse('Empty Data'),
        );
      },
      build: () => ListUsersBloc(repository: listUsersRepository),
      act: (bloc) => bloc.add(LoadMoreData(3)),
      expect: () => <ListUsersState>[
        ListUsersState(status: ViewStatus.noMoreData),
      ],
    );

  });


}
