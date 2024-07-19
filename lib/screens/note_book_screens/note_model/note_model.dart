// To parse this JSON data, do
//
//     final userDataModel = userDataModelFromJson(jsonString);

// ignore_for_file: file_names, non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/cupertino.dart';

NoteModel noteModelFromJson(String str) => NoteModel.fromJson(json.decode(str));

String noteModelToJson(NoteModel data) => json.encode(data.toJson());

class NoteModel extends ChangeNotifier {
  NoteModel({
    this.title,
    this.content,
    this.is_favourite,
    this.createdAt,
  });

  String? title;
  String? content;
  bool? is_favourite;
  String? createdAt;

  factory NoteModel.fromJson(Map<String, dynamic> json) => NoteModel(
        title: json["title"],
        content: json["content"],
        is_favourite: json["is_favourite"],
        createdAt: json["created_at"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "content": content,
        "is_favourite": is_favourite,
      };
}
