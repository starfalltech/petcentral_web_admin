// To parse this JSON data, do
//
//     final reservationListModel = reservationListModelFromJson(jsonString);

import 'dart:convert';

List<ReservationListModel> reservationListModelFromJson(String str) =>
    List<ReservationListModel>.from(
        json.decode(str).map((x) => ReservationListModel.fromJson(x)));

String reservationListModelToJson(List<ReservationListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ReservationListModel {
  ReservationListModel({
    this.id,
    this.numberOfPets,
    this.minCost,
    this.maxCost,
    this.dateCheckIn,
    this.dateCheckOut,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.serviceType,
    this.customer,
  });

  final int? id;
  final int? numberOfPets;
  final int? minCost;
  final int? maxCost;
  final String? dateCheckIn;
  final String? dateCheckOut;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final ServiceType? serviceType;
  final Customer? customer;

  factory ReservationListModel.fromJson(Map<String, dynamic> json) =>
      ReservationListModel(
        id: json["id"],
        numberOfPets: json["numberOfPets"],
        minCost: json["minCost"],
        maxCost: json["maxCost"],
        dateCheckIn: json["dateCheckIn"],
        dateCheckOut: json["dateCheckOut"],
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        serviceType: ServiceType.fromJson(json["ServiceType"]),
        customer: Customer.fromJson(json["customer"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "numberOfPets": numberOfPets,
        "minCost": minCost,
        "maxCost": maxCost,
        "dateCheckIn": dateCheckIn,
        "dateCheckOut": dateCheckOut,
        "status": status,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "ServiceType": serviceType!.toJson(),
        "customer": customer!.toJson(),
      };
}

class Customer {
  Customer({
    this.name,
  });

  final String? name;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}

class ServiceType {
  ServiceType({
    this.type,
  });

  final String? type;

  factory ServiceType.fromJson(Map<String, dynamic> json) => ServiceType(
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
      };
}