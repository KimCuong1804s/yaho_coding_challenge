import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yaho_coding_challenge/list_users/enum/view_mode.dart';
import 'package:yaho_coding_challenge/list_users/enum/view_status.dart';
import 'package:yaho_coding_challenge/list_users/widgets/empty_data.dart';
import 'package:yaho_coding_challenge/list_users/widgets/error_alert.dart';
import '../bloc/list_users_bloc.dart';
import '../bloc/list_users_state.dart';

class ListUsersPage extends StatefulWidget {
  const ListUsersPage({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ListUsersPage();
  }
}

class _ListUsersPage extends State<ListUsersPage> {
  late ListUsersBloc bloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    bloc = BlocProvider.of<ListUsersBloc>(context);
    bloc.addLoadFirstPageData();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return BlocBuilder<ListUsersBloc, ListUsersState>(
        builder: (context, state) {
      return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final newViewMode = bloc.state.viewMode.otherViewMode;
            bloc.addChangeViewMode(newViewMode);
          },
          tooltip: 'change view mode',
          child: state.viewMode.iconButton,
        ),
        appBar: AppBar(title: const Text("Yaho Code Challenge")),
        body: RefreshIndicator(
            onRefresh: () async {
              bloc.addLoadFirstPageData();
            },
            child: state.status.isEmptyData
                ? const EmptyData()
                : state.status.isError
                    ? const ErrorText()
                    : state.status.isRefreshing
                        ? Container(
                            color: Colors.transparent,
                            alignment: Alignment.center,
                            child: const SizedBox(
                              width: 100,
                              height: 100,
                              child: CircularProgressIndicator(
                                strokeWidth: 5,
                                backgroundColor: Colors.white,
                              ),
                            ),
                          )
                        : state.viewMode.viewWidget),
      );
    });
  }
}
