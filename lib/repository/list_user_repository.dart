import 'package:yaho_coding_challenge/repository/service/list_users_service.dart';

import 'models/list_users.dart';

class ListUsersRepository {
  const ListUsersRepository({
    required this.service,
  });

  final ListUsersService service;

  Future<ListUsersModel> getListUsersData(int page) async =>
      service.getListUsersData(page);
}
