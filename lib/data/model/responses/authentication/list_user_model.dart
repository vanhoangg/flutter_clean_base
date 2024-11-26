import 'dart:convert';

import 'user_model.dart';

ListUserModel listUserModelFromJson(String str) =>
    ListUserModel.fromJson(json.decode(str));

String listUserModelToJson(ListUserModel data) => json.encode(data.toJson());

class ListUserModel {
  final List<UserModel>? users;
  final int? total;
  final int? skip;
  final int? limit;

  ListUserModel({
    this.users,
    this.total,
    this.skip,
    this.limit,
  });

  ListUserModel copyWith({
    List<UserModel>? users,
    int? total,
    int? skip,
    int? limit,
  }) =>
      ListUserModel(
        users: users ?? this.users,
        total: total ?? this.total,
        skip: skip ?? this.skip,
        limit: limit ?? this.limit,
      );

  factory ListUserModel.fromJson(Map<String, dynamic> json) => ListUserModel(
        users: json['users'] == null
            ? []
            : List<UserModel>.from(
                json['users']?.map((x) => UserModel.fromJson(x))),
        total: json['total'],
        skip: json['skip'],
        limit: json['limit'],
      );

  Map<String, dynamic> toJson() => {
        'users': users == null
            ? []
            : List<dynamic>.from(users?.map((x) => x.toJson()) ?? []),
        'total': total,
        'skip': skip,
        'limit': limit,
      };
}
