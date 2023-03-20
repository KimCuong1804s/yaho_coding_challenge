import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/list_users_bloc.dart';
import '../bloc/list_users_event.dart';

class ErrorText extends StatelessWidget {
  const ErrorText({Key? key}) : super(key: key);

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
            Text(
              'Something went wrong',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Icon(Icons.refresh, size: 30),
            Expanded(flex: 6, child: SizedBox())
          ],
        ),
      ),
    );
  }
}