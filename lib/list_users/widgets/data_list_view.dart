import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yaho_coding_challenge/list_users/enum/view_status.dart';
import 'package:yaho_coding_challenge/list_users/widgets/avatar.dart';
import 'package:yaho_coding_challenge/list_users/widgets/loading_more.dart';

import '../bloc/list_users_bloc.dart';
import '../bloc/list_users_state.dart';

class DataListView extends StatefulWidget {
  const DataListView({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DataListView();
  }
}

class _DataListView extends State<DataListView> {
  late ListUsersBloc bloc;
  static const double endReachedThreshold = 10;
  final ScrollController listViewController = ScrollController();

  Future<void> onScroll() async {
    if (!listViewController.hasClients || bloc.state.status.isLoadingMore) {
      return; // if controller is mounted, the state isn't loading
    }

    final thresholdReached = listViewController.position.extentAfter <
        endReachedThreshold; // Check if scroll at _endReachedThreshold

    if (thresholdReached) {
      print('if (thresholdReached)');
      bloc.addLoadMoreData(bloc.state.listUsersModel.page!);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc = BlocProvider.of<ListUsersBloc>(context);
    listViewController.addListener(onScroll);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    listViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('build ListViewData');
    // TODO: implement build

    return BlocBuilder<ListUsersBloc, ListUsersState>(
        builder: (context, state) {
      return ListView.separated(
          physics: const ClampingScrollPhysics(),
          controller: listViewController,
          itemBuilder: (context, index) {
            if (index == state.listUsersModel.data!.length) {
              return const LoadingMore();
            }
            var userData = state.listUsersModel.data![index];
            return Row(
              children: [
                SizedBox(
                    height: 150, width: 150, child: Avatar(userData.avatar)),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                              'Name: ${userData.firstName} ${userData.lastName}',
                              maxLines: null)),
                      const SizedBox(height: 5),
                      Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Email: ${userData.email}',
                            maxLines: null,
                          ))
                    ],
                  ),
                ),
              ],
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 5,
            );
          },
          itemCount: state.listUsersModel.data!.length + 1);
    });
  }
}
