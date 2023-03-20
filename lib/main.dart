import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yaho_coding_challenge/list_users/view/list_users_page.dart';
import 'package:yaho_coding_challenge/repository/list_user_repository.dart';
import 'package:yaho_coding_challenge/repository/service/list_users_service.dart';

import 'list_users/bloc/list_users_bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (bloc is Cubit) print(change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }
}

void main() {
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RepositoryProvider(
        create: (BuildContext context) =>
            ListUsersRepository(service: ListUsersService()),
        child: BlocProvider<ListUsersBloc>(
          create: (context) => ListUsersBloc(repository: context.read<ListUsersRepository>()),
          child: const ListUsersPage(),
        ),
      ),
      // home: ListUsersPage(),
    );
  }
}
