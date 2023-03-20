import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yaho_coding_challenge/list_users/enum/view_status.dart';
import 'package:yaho_coding_challenge/list_users/widgets/avatar.dart';
import 'package:yaho_coding_challenge/list_users/widgets/loading_more.dart';

import '../bloc/list_users_bloc.dart';
import '../bloc/list_users_state.dart';

class DataGridView extends StatefulWidget {
  const DataGridView({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DataGirdView();
  }
}

class _DataGirdView extends State<DataGridView> {
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
    listViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final screenWidth = MediaQuery.of(context).size.width;

    return BlocBuilder<ListUsersBloc, ListUsersState>(
        builder: (context, state) {
      return GridView.builder(
        physics: const ClampingScrollPhysics(),
        controller: listViewController,
        padding: const EdgeInsets.only(top: 15),
        itemBuilder: (context, index) {
          if (index == state.listUsersModel.data!.length) {
            return const LoadingMore();
          }
          var userData = state.listUsersModel.data![index];
          return Column(
            children: [
              SizedBox(
                  height: screenWidth * 0.3,
                  width: screenWidth * 0.3,
                  child: Avatar(userData.avatar)),
              const SizedBox(height: 5),
              Text(
                'Name: ${userData.firstName} ${userData.lastName}',
                maxLines: null,
              ),
              const SizedBox(height: 5),
              Text(
                'Email: ${userData.email}',
                maxLines: null,
              )
            ],
          );
        },
        itemCount: state.listUsersModel.data!.length + 1,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 5, mainAxisSpacing: 5),
      );
    });
  }
}
