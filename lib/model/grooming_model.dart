// To parse this JSON data, do
//
//     final groomingListModel = groomingListModelFromJson(jsonString);

import 'dart:convert';

List<GroomingListModel> groomingListModelFromJson(String str) =>
    List<GroomingListModel>.from(
        json.decode(str).map((x) => GroomingListModel.fromJson(x)));

String groomingListModelToJson(List<GroomingListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GroomingListModel {
  GroomingListModel({
    this.id,
    this.date,
    this.time,
    this.cost,
    this.paymentStatus,
    this.status,
    this.serviceType,
    this.customer,
    this.pet,
  });

  final int? id;
  final String? date;
  final String? time;
  final int? cost;
  final String? paymentStatus;
  final String? status;
  final ServiceType? serviceType;
  final Customer? customer;
  final Pet? pet;

  factory GroomingListModel.fromJson(Map<String, dynamic> json) =>
      GroomingListModel(
        id: json["id"] == null ? null : json["id"],
        date: json["date"] == null ? null : json["date"],
        time: json["time"] == null ? null : json["time"],
        cost: json["cost"] == null ? null : json["cost"],
        paymentStatus:
            json["paymentStatus"] == null ? null : json["paymentStatus"],
        status: json["status"] == null ? null : json["status"],
        serviceType: json["ServiceType"] == null
            ? null
            : ServiceType.fromJson(json["ServiceType"]),
        customer: json["customer"] == null
            ? null
            : Customer.fromJson(json["customer"]),
        pet: json["pet"] == null ? null : Pet.fromJson(json["pet"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "date": date == null ? null : date,
        "time": time == null ? null : time,
        "cost": cost == null ? null : cost,
        "paymentStatus": paymentStatus == null ? null : paymentStatus,
        "status": status == null ? null : status,
        "ServiceType": serviceType == null ? null : serviceType!.toJson(),
        "customer": customer == null ? null : customer!.toJson(),
        "pet": pet == null ? null : pet!.toJson(),
      };
}

class Customer {
  Customer({
    this.name,
  });

  final String? name;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
      };
}

class Pet {
  Pet({
    this.name,
    this.type,
    this.gender,
    this.breed,
  });

  final String? name;
  final String? type;
  final String? gender;
  final Customer? breed;

  factory Pet.fromJson(Map<String, dynamic> json) => Pet(
        name: json["name"] == null ? null : json["name"],
        type: json["type"] == null ? null : json["type"],
        gender: json["gender"] == null ? null : json["gender"],
        breed: json["breed"] == null ? null : Customer.fromJson(json["breed"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "type": type == null ? null : type,
        "gender": gender == null ? null : gender,
        "breed": breed == null ? null : breed!.toJson(),
      };
}

class ServiceType {
  ServiceType({
    this.type,
  });

  final String? type;

  factory ServiceType.fromJson(Map<String, dynamic> json) => ServiceType(
        type: json["type"] == null ? null : json["type"],
      );

  Map<String, dynamic> toJson() => {
        "type": type == null ? null : type,
      };
}
