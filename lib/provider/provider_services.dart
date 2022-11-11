import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:petcentral_web_admin/api_services/api_services.dart';
import 'package:petcentral_web_admin/model/customer_model.dart';
import 'package:petcentral_web_admin/model/grooming_detail_model.dart';
import 'package:petcentral_web_admin/model/grooming_model.dart';
import 'package:petcentral_web_admin/model/reservation_detail_model.dart';
import 'package:petcentral_web_admin/model/reservation_model.dart';

final customerList =
    FutureProvider.autoDispose<List<CustomerListModel>>((ref) async {
  return ref.watch(customerProvider).getCustomerList();
});

final groomingListPending =
    FutureProvider.autoDispose<List<GroomingListModel>>((ref) async {
  return ref.watch(customerProvider).getGroomingListPending();
});

final groomingListApproved =
    FutureProvider.autoDispose<List<GroomingListModel>>((ref) async {
  return ref.watch(customerProvider).getGroomingListApproved();
});

final groomingListRejected =
    FutureProvider.autoDispose<List<GroomingListModel>>((ref) async {
  return ref.watch(customerProvider).getGroomingListRejected();
});

final groomingDetails =
    FutureProvider.family<GroomingDetailsModel, int>((ref, id) async {
  return ApiServices().getGroomingDetails(id);
});

final reservationListPending =
    FutureProvider.autoDispose<List<ReservationListModel>>((ref) async {
  return ref.watch(customerProvider).getReservationListPending();
});

final reservationListApproved =
    FutureProvider.autoDispose<List<ReservationListModel>>((ref) async {
  return ref.watch(customerProvider).getReservationListApproved();
});

final reservationListRejected =
    FutureProvider.autoDispose<List<ReservationListModel>>((ref) async {
  return ref.watch(customerProvider).getReservationListRejected();
});

final reservationDetails =
    FutureProvider.family<ReservationDetailsModel, int>((ref, id) async {
  return ApiServices().getReservationDetails(id);
});
