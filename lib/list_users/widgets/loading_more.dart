import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yaho_coding_challenge/list_users/bloc/list_users_bloc.dart';
import 'package:yaho_coding_challenge/list_users/enum/view_status.dart';

import '../bloc/list_users_state.dart';

class LoadingMore extends StatefulWidget {
  const LoadingMore({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoadingMore();
  }
}

class _LoadingMore extends State<LoadingMore> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return BlocBuilder<ListUsersBloc, ListUsersState>(
        builder: (context, state) {
      return SizedBox(
        height: 70,
        child: Row(
          children: [
            const Expanded(child: SizedBox()),
            state.status.isNoMoreData
                ? Container(
                    alignment: Alignment.center,
                    child: const Text('No more data.'),
                  )
                : (state.status.isLoadingMore
                    ? Container(
                        color: Colors.transparent,
                        alignment: Alignment.center,
                        child: Row(
                          children: const [
                            CircularProgressIndicator(
                              strokeWidth: 3,
                              backgroundColor: Colors.white,
                            ),
                            SizedBox(width: 15),
                            Text('Loading more ...'),
                          ],
                        ),
                      )
                    : const Text('Load more')),
            const Expanded(child: SizedBox()),
          ],
        ),
      );
    });
  }
}
