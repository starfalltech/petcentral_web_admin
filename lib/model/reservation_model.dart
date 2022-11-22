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
    this.cost,
    this.dateCheckIn,
    this.dateCheckOut,
    this.checkInAt,
    this.checkOutAt,
    this.paymentStatus,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.serviceType,
    this.customer,
  });

  final int? id;
  final int? numberOfPets;
  final int? cost;
  final String? dateCheckIn;
  final String? dateCheckOut;
  final DateTime? checkInAt;
  final DateTime? checkOutAt;
  final String? paymentStatus;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final ServiceType? serviceType;
  final Customer? customer;

  factory ReservationListModel.fromJson(Map<String, dynamic> json) =>
      ReservationListModel(
        id: json["id"],
        numberOfPets: json["numberOfPets"],
        cost: json["cost"],
        dateCheckIn: json["dateCheckIn"],
        dateCheckOut: json["dateCheckOut"],
        checkInAt: json["checkInAt"] == null
            ? null
            : DateTime.parse(json["checkInAt"]),
        checkOutAt: json["checkOutAt"] == null
            ? null
            : DateTime.parse(json["checkOutAt"]),
        paymentStatus: json["paymentStatus"],
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        serviceType: ServiceType.fromJson(json["ServiceType"]),
        customer: Customer.fromJson(json["customer"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "numberOfPets": numberOfPets,
        "cost": cost,
        "dateCheckIn": dateCheckIn,
        "dateCheckOut": dateCheckOut,
        "checkInAt": checkInAt == null ? null : checkInAt!.toIso8601String(),
        "checkOutAt": checkOutAt == null ? null : checkOutAt!.toIso8601String(),
        "paymentStatus": paymentStatus,
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
