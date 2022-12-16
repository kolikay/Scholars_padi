// To parse this JSON data, do
//
//     final userDataModel = userDataModelFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter/cupertino.dart';

NoteModel noteModelFromJson(String str) => NoteModel.fromJson(json.decode(str));

String noteModelToJson(NoteModel data) => json.encode(data.toJson());

class NoteModel extends ChangeNotifier {
  NoteModel({
    this.title,
    this.content,
    this.isFav,
    this.createdAt,
  });

  String? title;
  String? content;
  bool? isFav;
  String? createdAt;

  factory NoteModel.fromJson(Map<String, dynamic> json) => NoteModel(
        title: json["title"],
        content: json["content"],
        isFav: json["isFav"],
        createdAt: json["created_at"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "content": content,
        "isFav": isFav,
      };
}
