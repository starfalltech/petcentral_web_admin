// To parse this JSON data, do
//
//     final reservationDetailsModel = reservationDetailsModelFromJson(jsonString);

import 'dart:convert';

ReservationDetailsModel reservationDetailsModelFromJson(String str) =>
    ReservationDetailsModel.fromJson(json.decode(str));

String reservationDetailsModelToJson(ReservationDetailsModel data) =>
    json.encode(data.toJson());

class ReservationDetailsModel {
  ReservationDetailsModel({
    this.id,
    this.branchId,
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
    this.petInRoom,
  });

  final int? id;
  final int? branchId;
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
  final List<PetInRoom>? petInRoom;

  factory ReservationDetailsModel.fromJson(Map<String, dynamic> json) =>
      ReservationDetailsModel(
        id: json["id"] == null ? null : json["id"],
        branchId: json["branchId"] == null ? null : json["branchId"],
        numberOfPets:
            json["numberOfPets"] == null ? null : json["numberOfPets"],
        minCost: json["minCost"] == null ? null : json["minCost"],
        maxCost: json["maxCost"] == null ? null : json["maxCost"],
        dateCheckIn: json["dateCheckIn"] == null ? null : json["dateCheckIn"],
        dateCheckOut:
            json["dateCheckOut"] == null ? null : json["dateCheckOut"],
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
        petInRoom: json["PetInRoom"] == null
            ? null
            : List<PetInRoom>.from(
                json["PetInRoom"].map((x) => PetInRoom.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "branchId": branchId == null ? null : branchId,
        "numberOfPets": numberOfPets == null ? null : numberOfPets,
        "minCost": minCost == null ? null : minCost,
        "maxCost": maxCost == null ? null : maxCost,
        "dateCheckIn": dateCheckIn == null ? null : dateCheckIn,
        "dateCheckOut": dateCheckOut == null ? null : dateCheckOut,
        "status": status == null ? null : status,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "ServiceType": serviceType == null ? null : serviceType!.toJson(),
        "customer": customer == null ? null : customer!.toJson(),
        "PetInRoom": petInRoom == null
            ? null
            : List<dynamic>.from(petInRoom!.map((x) => x.toJson())),
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
  final String? homeAddress;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["id"] == null ? null : json["id"],
        userId: json["userId"] == null ? null : json["userId"],
        email: json["email"] == null ? null : json["email"],
        name: json["name"] == null ? null : json["name"],
        mobilePhone: json["mobilePhone"] == null ? null : json["mobilePhone"],
        homeAddress: json["homeAddress"] == null ? null : json["homeAddress"],
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
        "homeAddress": homeAddress == null ? null : homeAddress,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
      };
}

class PetInRoom {
  PetInRoom({
    this.id,
    this.pet,
  });

  final int? id;
  final Pet? pet;

  factory PetInRoom.fromJson(Map<String, dynamic> json) => PetInRoom(
        id: json["id"] == null ? null : json["id"],
        pet: json["pet"] == null ? null : Pet.fromJson(json["pet"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "pet": pet == null ? null : pet!.toJson(),
      };
}

class Pet {
  Pet({
    this.id,
    this.petId,
    this.name,
    this.weight,
    this.type,
    this.dob,
    this.color,
    this.pictures,
    this.description,
    this.gender,
    this.createdAt,
    this.updatedAt,
    this.breed,
    this.age,
    this.ageUnit,
  });

  final int? id;
  final String? petId;
  final String? name;
  final double? weight;
  final String? type;
  final DateTime? dob;
  final String? color;
  final String? pictures;
  final String? description;
  final String? gender;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Breed? breed;
  final int? age;
  final String? ageUnit;

  factory Pet.fromJson(Map<String, dynamic> json) => Pet(
        id: json["id"] == null ? null : json["id"],
        petId: json["petId"] == null ? null : json["petId"],
        name: json["name"] == null ? null : json["name"],
        weight: json["weight"] == null ? null : json["weight"].toDouble(),
        type: json["type"] == null ? null : json["type"],
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
        color: json["color"] == null ? null : json["color"],
        pictures: json["pictures"] == null ? null : json["pictures"],
        description: json["description"] == null ? null : json["description"],
        gender: json["gender"] == null ? null : json["gender"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        breed: json["breed"] == null ? null : Breed.fromJson(json["breed"]),
        age: json["age"] == null ? null : json["age"],
        ageUnit: json["ageUnit"] == null ? null : json["ageUnit"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "petId": petId == null ? null : petId,
        "name": name == null ? null : name,
        "weight": weight == null ? null : weight,
        "type": type == null ? null : type,
        "dob": dob == null
            ? null
            : "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}",
        "color": color == null ? null : color,
        "pictures": pictures == null ? null : pictures,
        "description": description == null ? null : description,
        "gender": gender == null ? null : gender,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "breed": breed == null ? null : breed!.toJson(),
        "age": age == null ? null : age,
        "ageUnit": ageUnit == null ? null : ageUnit,
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
