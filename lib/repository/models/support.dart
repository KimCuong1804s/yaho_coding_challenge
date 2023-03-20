import 'dart:convert';

import 'package:equatable/equatable.dart';

SupportModel supportModelFromJson(String str) =>
    SupportModel.fromJson(json.decode(str));

String supportModelToJson(SupportModel data) => json.encode(data.toJson());

class SupportModel extends Equatable {
  SupportModel({this.url = '', this.text = ''});

  String? url;
  String? text;

  factory SupportModel.fromJson(Map<String, dynamic> json) => SupportModel(
        url: json['url'] ?? '',
        text: json['text'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "text": text,
      };

  @override
  // TODO: implement props
  List<Object?> get props => [url, text];
}
