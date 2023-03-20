import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:yaho_coding_challenge/repository/models/support.dart';
import 'package:yaho_coding_challenge/repository/models/user.dart';

ListUsersModel listUsersModelFromJson(String str) =>
    ListUsersModel.fromJson(json.decode(str));

String listUsersModelToJson(ListUsersModel data) => json.encode(data.toJson());

class ListUsersModel extends Equatable {
  ListUsersModel(
      {this.page = 0,
      this.perPage = 0,
      this.total = 0,
      this.totalPages = 0,
      this.data,
      this.support}) {
    data ??= [];
  }

  int? page;
  int? perPage;
  int? total;
  int? totalPages;
  List<UserModel>? data;
  SupportModel? support;

  ListUsersModel copyWith({
    int? page,
    int? perPage,
    int? total,
    int? totalPages,
    List<UserModel>? data,
    SupportModel? support,
  }) {
    return ListUsersModel(
      page: page ?? this.page,
      perPage: perPage ?? this.perPage,
      total: total ?? this.total,
      totalPages: totalPages ?? this.totalPages,
      data: data ?? this.data,
      support: support ?? this.support,
    );
  }

  factory ListUsersModel.fromJson(Map<String, dynamic> json) => ListUsersModel(
        page: json['page'] ?? 1,
        perPage: json['per_page'] ?? 0,
        total: json['total'] ?? 0,
        totalPages: json['total_pages'] ?? 0,
        data: List<UserModel>.from(
            (json['data'] ?? []).map((e) => UserModel.fromJson(e))),
        support: json['support'] != null
            ? SupportModel.fromJson(json['support'])
            : SupportModel(),
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "per_page": perPage,
        "total": total,
        "total_pages": totalPages,
        "data": data,
        "support": support,
      };

  @override
  // TODO: implement props
  List<Object?> get props => [page, perPage, total, totalPages, data, support];
}
