// To parse this JSON data, do
//
//     final allPetModel = allPetModelFromJson(jsonString);

import 'dart:convert';

List<AllPetModel> allPetModelFromJson(String str) => List<AllPetModel>.from(
    json.decode(str).map((x) => AllPetModel.fromJson(x)));

String allPetModelToJson(List<AllPetModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllPetModel {
  AllPetModel({
    this.id,
    this.petId,
    this.name,
    this.weight,
    this.type,
    this.dob,
    this.pictures,
    this.description,
    this.gender,
    this.createdAt,
    this.updatedAt,
    this.owner,
    this.breed,
    this.ageUnit,
    this.age,
  });

  final int? id;
  final String? petId;
  final String? name;
  final double? weight;
  final String? type;
  final DateTime? dob;
  final String? pictures;
  final String? description;
  final String? gender;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Owner? owner;
  final Breed? breed;
  final String? ageUnit;
  final int? age;

  factory AllPetModel.fromJson(Map<String, dynamic> json) => AllPetModel(
        id: json["id"],
        petId: json["petId"],
        name: json["name"],
        weight: json["weight"].toDouble(),
        type: json["type"],
        dob: DateTime.parse(json["dob"]),
        pictures: json["pictures"],
        description: json["description"],
        gender: json["gender"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        owner: Owner.fromJson(json["owner"]),
        breed: Breed.fromJson(json["breed"]),
        ageUnit: json["ageUnit"],
        age: json["age"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "petId": petId,
        "name": name,
        "weight": weight,
        "type": type,
        "dob":
            "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}",
        "pictures": pictures,
        "description": description,
        "gender": gender,
        "createdAt": createdAt!.toIso8601String(),
        "owner": owner!.toJson(),
        "breed": breed!.toJson(),
        "ageUnit": ageUnit,
        "age": age,
      };
}

class Breed {
  Breed({
    this.name,
  });

  final String? name;

  factory Breed.fromJson(Map<String, dynamic> json) => Breed(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}

class Owner {
  Owner({
    this.name,
    this.mobilePhone,
    this.homeAddress,
    this.email,
  });

  final String? name;
  final String? mobilePhone;
  final String? homeAddress;
  final String? email;

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        name: json["name"],
        mobilePhone: json["mobilePhone"],
        homeAddress: json["homeAddress"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "mobilePhone": mobilePhone,
        "homeAddress": homeAddress,
        "email": email,
      };
}
