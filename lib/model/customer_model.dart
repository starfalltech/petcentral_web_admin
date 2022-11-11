// To parse this JSON data, do
//
//     final customerListModel = customerListModelFromJson(jsonString);

import 'dart:convert';

List<CustomerListModel> customerListModelFromJson(String str) =>
    List<CustomerListModel>.from(
        json.decode(str).map((x) => CustomerListModel.fromJson(x)));

String customerListModelToJson(List<CustomerListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CustomerListModel {
  CustomerListModel({
    this.id,
    this.userId,
    this.email,
    this.name,
    this.mobilePhone,
    this.homeAddress,
    this.createdAt,
    this.updatedAt,
  });

  final int? id;
  final String? userId;
  final String? email;
  final String? name;
  final String? mobilePhone;
  final String? homeAddress;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory CustomerListModel.fromJson(Map<String, dynamic> json) =>
      CustomerListModel(
        id: json["id"],
        userId: json["userId"],
        email: json["email"],
        name: json["name"],
        mobilePhone: json["mobilePhone"],
        homeAddress: json["homeAddress"] ?? null,
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "email": email,
        "name": name,
        "mobilePhone": mobilePhone,
        "homeAddress": homeAddress ?? null,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
      };
}
