// To parse this JSON data, do
//
//     final userDataModel = userDataModelFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter/cupertino.dart';

UserModel userDataModelFromJson(String str) =>
    UserModel.fromJson(json.decode(str));

String userDataModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel extends ChangeNotifier {
  UserModel({
    this.id,
    this.email,
    this.username,
    this.fullname,
    this.confirmed,
    this.active,
    this.role,
    this.gender,
    this.phoneNumber,
    this.verified,
    this.faculty,
    // this.surname,
    this.profilePhoto,
    // this.dob,
  });

  String? id;
  String? fullname;
  String? username;
  String? email;
  String? gender;
  String? faculty;
  String? profilePhoto;
  bool? confirmed;
  bool? active;
  String? role;
  String? phoneNumber;
    bool? verified;
  // String? location;
  // String? name;


  // String? dob;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["_id"],
        fullname: json["full_name"],
        username: json["username"],
        email: json["email"],
        gender: json["gender"],
        confirmed: json["confirmed"],
        verified:json["verified"] ,
        faculty: json["faculty"],
        active: json["active"],
        role: json["role"],
        phoneNumber: json["phoneNumber"],
        profilePhoto: json["profilePhoto"],

        // location: json["location"],

        // occupation: json["occupation"],

        // dob: json["dob"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "email": email,
        "username": username,
        "full_name": fullname,
        "confirmed": confirmed,
        // "active": active,
        // "about": about,
        // "gender": gender,
        // "interest": interest,
        // "location": location,
        // "name": name,
        // "occupation": occupation,
        // "surname": surname,
        // "photo": photo,
        // "dob": dob,
      };
}
