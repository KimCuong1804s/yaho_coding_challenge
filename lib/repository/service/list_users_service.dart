import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:yaho_coding_challenge/repository/models/exception.dart';

import '../models/list_users.dart';

class ListUsersService {
  ListUsersService({
    http.Client? httpClient,
    this.baseUrl = 'https://reqres.in/api',
  }) : httpClient = httpClient ?? http.Client();

  final String baseUrl;
  final Client httpClient;

  Future<ListUsersModel> getListUsersData(int page) async {
    try {
      final url = '$baseUrl/users?page=$page';
      print('url: $url');
      Response response = await get(Uri.parse(url));
      print('Response: ${response.body}');
      await Future.delayed(
          const Duration(milliseconds: 600)); //fake delay loading
      if (response.statusCode == 200) {
        ListUsersModel listUsersModel = listUsersModelFromJson(response.body);
        if (listUsersModel.data!.isNotEmpty) {
          return listUsersModel;
        }
        throw ErrorEmptyResponse('Empty data');
      } else {
        throw ErrorGettingListUsers(response.reasonPhrase ?? '');
      }
    } on SocketException catch (ex) {
      throw ErrorNoNetworking(ex.toString());
    }
  }
}
