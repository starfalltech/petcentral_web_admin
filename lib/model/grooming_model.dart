import 'dart:convert';

List<GroomingListModel> groomingListModelFromJson(String str) =>
    List<GroomingListModel>.from(
        json.decode(str).map((x) => GroomingListModel.fromJson(x)));

class GroomingListModel {
  GroomingListModel({
    this.id,
    this.date,
    this.time,
    this.minCost,
    this.maxCost,
    this.status,
    this.serviceType,
    this.customer,
    this.pet,
  });

  final int? id;
  final String? date;
  final String? time;
  final int? minCost;
  final int? maxCost;
  final String? status;
  final ServiceType? serviceType;
  final Customer? customer;
  final Pet? pet;

  factory GroomingListModel.fromJson(Map<String, dynamic> json) =>
      GroomingListModel(
        id: json["id"],
        date: json["date"],
        time: json["time"],
        minCost: json["minCost"],
        maxCost: json["maxCost"],
        status: json["status"],
        serviceType: ServiceType.fromJson(json["ServiceType"]),
        customer: Customer.fromJson(json["customer"]),
        pet: Pet.fromJson(json["pet"]),
      );
}

class Customer {
  Customer({
    this.name,
  });

  final String? name;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        name: json["name"],
      );
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
        name: json["name"],
        type: json["type"],
        gender: json["gender"],
        breed: Customer.fromJson(json["breed"]),
      );
}

class ServiceType {
  ServiceType({
    this.type,
  });

  final String? type;

  factory ServiceType.fromJson(Map<String, dynamic> json) => ServiceType(
        type: json["type"],
      );
}
