// To parse this JSON data, do
//
//     final createUserResponse = createUserResponseFromJson(jsonString);

import 'dart:convert';

import 'package:api_intergration/services/api_service/apiable/api_outputable.dart';

CreateUserResponse createUserResponseFromJson(String str) =>
    CreateUserResponse.fromJson(json.decode(str));

String createUserResponseToJson(CreateUserResponse data) =>
    json.encode(data.toJson());

class CreateUserResponse implements ApiOutputable {
  @override
  buildFromJson(String json) {
    return createUserResponseFromJson(json);
  }

  static getDefault() {
    return CreateUserResponse(
      createdAt: null,
      job: null,
      id: null,
    );
  }

  CreateUserResponse({
    this.name,
    this.job,
    this.id,
    this.createdAt,
  });

  String? name;
  String? job;
  String? id;
  DateTime? createdAt;

  CreateUserResponse copyWith({
    String? name,
    String? job,
    String? id,
    DateTime? createdAt,
  }) =>
      CreateUserResponse(
        name: name ?? this.name,
        job: job ?? this.job,
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
      );

  factory CreateUserResponse.fromJson(Map<String, dynamic> json) =>
      CreateUserResponse(
        name: json["name"] == null ? null : json["name"],
        job: json["job"] == null ? null : json["job"],
        id: json["id"] == null ? null : json["id"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "job": job == null ? null : job,
        "id": id == null ? null : id,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
      };
}
