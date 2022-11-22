import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:petcentral_web_admin/model/all_pet_model.dart';
import 'package:petcentral_web_admin/model/customer_model.dart';
import 'package:http/http.dart' as http;
import 'package:petcentral_web_admin/model/grooming_detail_model.dart';
import 'package:petcentral_web_admin/model/grooming_model.dart';
import 'package:petcentral_web_admin/model/reservation_detail_model.dart';
import 'package:petcentral_web_admin/model/reservation_model.dart';

class ApiServices {
  Future<List<CustomerListModel>> getCustomerList() async {
    var request = http.Request(
        'GET', Uri.parse('https://api.petcentral.id/admin/customers'));

    http.StreamedResponse response = await request.send();
    var data = await response.stream.bytesToString();
    if (response.statusCode == 200) {
      debugPrint(data);
    } else {
      debugPrint(response.reasonPhrase);
    }
    return customerListModelFromJson(data);
  }

//! Grooming Section
  Future<List<GroomingListModel>> getGroomingListPending() async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST',
        Uri.parse('https://api.petcentral.id/admin/reservations/grooming'));
    request.body = json.encode({"branchId": 1, "status": "pending"});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var data = await response.stream.bytesToString();

    if (response.statusCode == 200) {
      debugPrint(data);
    } else {
      debugPrint(response.reasonPhrase);
    }

    return groomingListModelFromJson(data);
  }

  Future<List<GroomingListModel>> getGroomingListApproved() async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST',
        Uri.parse('https://api.petcentral.id/admin/reservations/grooming'));
    request.body = json.encode({"branchId": 1, "status": "approved"});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var data = await response.stream.bytesToString();

    if (response.statusCode == 200) {
      debugPrint(data);
    } else {
      debugPrint(response.reasonPhrase);
    }

    return groomingListModelFromJson(data);
  }

  Future<List<GroomingListModel>> getGroomingListRejected() async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST',
        Uri.parse('https://api.petcentral.id/admin/reservations/grooming'));
    request.body = json.encode({"branchId": 1, "status": "rejected"});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var data = await response.stream.bytesToString();

    if (response.statusCode == 200) {
      debugPrint(data);
    } else {
      debugPrint(response.reasonPhrase);
    }

    return groomingListModelFromJson(data);
  }

  Future<GroomingDetailsModel> getGroomingDetails(int id) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://api.petcentral.id/admin/reservations/grooming/detail'));
    request.body = json.encode({"id": id});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var data = await response.stream.bytesToString();
    if (response.statusCode == 200) {
      debugPrint(data);
    } else {
      debugPrint(response.reasonPhrase);
    }
    return groomingDetailsModelFromJson(data);
  }

  //!Hotel Section

  Future<List<ReservationListModel>> getReservationListPending() async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST',
        Uri.parse('https://api.petcentral.id/admin/reservations/hotel'));
    request.body = json.encode({"branchId": 1, "status": "pending"});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var data = await response.stream.bytesToString();
    if (response.statusCode == 200) {
      debugPrint(data);
    } else {
      debugPrint(response.reasonPhrase);
    }

    return reservationListModelFromJson(data);
  }

  Future<List<ReservationListModel>> getReservationListApproved() async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST',
        Uri.parse('https://api.petcentral.id/admin/reservations/hotel'));
    request.body = json.encode({"branchId": 1, "status": "approved"});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var data = await response.stream.bytesToString();
    if (response.statusCode == 200) {
      debugPrint(data);
    } else {
      debugPrint(response.reasonPhrase);
    }

    return reservationListModelFromJson(data);
  }

  Future<List<ReservationListModel>> getReservationListRejected() async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST',
        Uri.parse('https://api.petcentral.id/admin/reservations/hotel'));
    request.body = json.encode({"branchId": 1, "status": "rejected"});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var data = await response.stream.bytesToString();
    if (response.statusCode == 200) {
      debugPrint(data);
    } else {
      debugPrint(response.reasonPhrase);
    }

    return reservationListModelFromJson(data);
  }

  Future<List<ReservationListModel>> checkIn() async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST',
        Uri.parse('https://api.petcentral.id/admin/reservations/hotel'));
    request.body = json.encode({"branchId": 1, "status": "checked_in"});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var data = await response.stream.bytesToString();
    if (response.statusCode == 200) {
      debugPrint(data);
    } else {
      debugPrint(response.reasonPhrase);
    }
    return reservationListModelFromJson(data);
  }

  Future<List<ReservationListModel>> checkOut() async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST',
        Uri.parse('https://api.petcentral.id/admin/reservations/hotel'));
    request.body = json.encode({"branchId": 1, "status": "checked_out"});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var data = await response.stream.bytesToString();
    if (response.statusCode == 200) {
      debugPrint(data);
    } else {
      debugPrint(response.reasonPhrase);
    }
    return reservationListModelFromJson(data);
  }

  Future<ReservationDetailsModel> getReservationDetails(int id) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST',
        Uri.parse('https://api.petcentral.id/admin/reservations/hotel/detail'));
    request.body = json.encode({"id": id});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var data = await response.stream.bytesToString();
    if (response.statusCode == 200) {
      debugPrint(data);
    } else {
      debugPrint(response.reasonPhrase);
    }
    return reservationDetailsModelFromJson(data);
  }

//! AllPet Section
  Future<List<AllPetModel>> getAllPet() async {
    var request = http.Request(
        'GET', Uri.parse('https://api.petcentral.id/admin/customer/pets'));

    http.StreamedResponse response = await request.send();
    var data = await response.stream.bytesToString();
    if (response.statusCode == 200) {
      print(data);
    } else {
      print(response.reasonPhrase);
    }
    return allPetModelFromJson(data);
  }
}

final customerProvider = Provider<ApiServices>((ref) => ApiServices());
