// To parse this JSON data, do
//
//     final groomingDetailsModel = groomingDetailsModelFromJson(jsonString);

import 'dart:convert';

GroomingDetailsModel groomingDetailsModelFromJson(String str) =>
    GroomingDetailsModel.fromJson(json.decode(str));

String groomingDetailsModelToJson(GroomingDetailsModel data) =>
    json.encode(data.toJson());

class GroomingDetailsModel {
  GroomingDetailsModel({
    this.id,
    this.branchId,
    this.date,
    this.time,
    this.minCost,
    this.maxCost,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.serviceType,
    this.customer,
    this.pet,
  });

  final int? id;
  final int? branchId;
  final DateTime? date;
  final String? time;
  final int? minCost;
  final int? maxCost;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final ServiceType? serviceType;
  final Customer? customer;
  final Pet? pet;

  factory GroomingDetailsModel.fromJson(Map<String, dynamic> json) =>
      GroomingDetailsModel(
        id: json["id"] == null ? null : json["id"],
        branchId: json["branchId"] == null ? null : json["branchId"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        time: json["time"] == null ? null : json["time"],
        minCost: json["minCost"] == null ? null : json["minCost"],
        maxCost: json["maxCost"] == null ? null : json["maxCost"],
        status: json["status"] == null ? null : json["status"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
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
        "branchId": branchId == null ? null : branchId,
        "date": date == null
            ? null
            : "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "time": time == null ? null : time,
        "minCost": minCost == null ? null : minCost,
        "maxCost": maxCost == null ? null : maxCost,
        "status": status == null ? null : status,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "ServiceType": serviceType == null ? null : serviceType!.toJson(),
        "customer": customer == null ? null : customer!.toJson(),
        "pet": pet == null ? null : pet!.toJson(),
      };
}

class Customer {
  Customer({
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
  final dynamic homeAddress;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["id"] == null ? null : json["id"],
        userId: json["userId"] == null ? null : json["userId"],
        email: json["email"] == null ? null : json["email"],
        name: json["name"] == null ? null : json["name"],
        mobilePhone: json["mobilePhone"] == null ? null : json["mobilePhone"],
        homeAddress: json["homeAddress"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "userId": userId == null ? null : userId,
        "email": email == null ? null : email,
        "name": name == null ? null : name,
        "mobilePhone": mobilePhone == null ? null : mobilePhone,
        "homeAddress": homeAddress,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
      };
}

class Pet {
  Pet({
    this.id,
    this.petId,
    this.name,
    this.userId,
    this.weight,
    this.breedId,
    this.type,
    this.dob,
    this.color,
    this.pictures,
    this.description,
    this.gender,
    this.createdAt,
    this.updatedAt,
    this.breed,
  });

  final int? id;
  final String? petId;
  final String? name;
  final int? userId;
  final double? weight;
  final int? breedId;
  final String? type;
  final DateTime? dob;
  final dynamic color;
  final dynamic pictures;
  final String? description;
  final String? gender;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Breed? breed;

  factory Pet.fromJson(Map<String, dynamic> json) => Pet(
        id: json["id"] == null ? null : json["id"],
        petId: json["petId"] == null ? null : json["petId"],
        name: json["name"] == null ? null : json["name"],
        userId: json["userId"] == null ? null : json["userId"],
        weight: json["weight"] == null ? null : json["weight"],
        breedId: json["breedId"] == null ? null : json["breedId"],
        type: json["type"] == null ? null : json["type"],
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
        color: json["color"],
        pictures: json["pictures"],
        description: json["description"] == null ? null : json["description"],
        gender: json["gender"] == null ? null : json["gender"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        breed: json["breed"] == null ? null : Breed.fromJson(json["breed"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "petId": petId == null ? null : petId,
        "name": name == null ? null : name,
        "userId": userId == null ? null : userId,
        "weight": weight == null ? null : weight,
        "breedId": breedId == null ? null : breedId,
        "type": type == null ? null : type,
        "dob": dob == null
            ? null
            : "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}",
        "color": color,
        "pictures": pictures,
        "description": description == null ? null : description,
        "gender": gender == null ? null : gender,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "breed": breed == null ? null : breed!.toJson(),
      };
}

class Breed {
  Breed({
    this.name,
    this.pictures,
  });

  final String? name;
  final String? pictures;

  factory Breed.fromJson(Map<String, dynamic> json) => Breed(
        name: json["name"] == null ? null : json["name"],
        pictures: json["pictures"] == null ? null : json["pictures"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "pictures": pictures == null ? null : pictures,
      };
}

class ServiceType {
  ServiceType({
    this.id,
    this.serviceId,
    this.type,
    this.description,
    this.updatedAt,
  });

  final int? id;
  final int? serviceId;
  final String? type;
  final String? description;
  final DateTime? updatedAt;

  factory ServiceType.fromJson(Map<String, dynamic> json) => ServiceType(
        id: json["id"] == null ? null : json["id"],
        serviceId: json["serviceId"] == null ? null : json["serviceId"],
        type: json["type"] == null ? null : json["type"],
        description: json["description"] == null ? null : json["description"],
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "serviceId": serviceId == null ? null : serviceId,
        "type": type == null ? null : type,
        "description": description == null ? null : description,
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
      };
}
