import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yaho_coding_challenge/list_users/bloc/list_users_bloc.dart';
import 'package:yaho_coding_challenge/list_users/bloc/list_users_event.dart';

class EmptyData extends StatelessWidget {
  const EmptyData({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<ListUsersBloc>(context).add(LoadFirstPageData());
      },
      child: Container(
        alignment: Alignment.center,
        color: Colors.transparent,
        child: Column(
          children: const [
            Expanded(
              flex: 4,
              child: SizedBox(),
            ),
            Text('There is no data'),
            SizedBox(
              height: 50,
            ),
            Icon(Icons.refresh, size: 30),
            Expanded(flex: 6, child: SizedBox())
          ],
        ),
      ),
    );
    // });
  }
}
