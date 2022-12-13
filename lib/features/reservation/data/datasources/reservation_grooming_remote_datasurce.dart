import 'package:petcentral_web_admin/core/error/exceptions.dart';
import 'package:petcentral_web_admin/core/platform/local_auth_storage/auth_storage.dart';
import 'package:petcentral_web_admin/core/platform/rest_client_service/rest_client_service.dart';
import 'package:petcentral_web_admin/features/reservation/domain/entity/reservation_grooming_entity.dart';
import 'package:petcentral_web_admin/features/reservation/domain/entity/reservation_hotel_entity.dart';

abstract class ReservationGroomingRemoteDataSource {
  Future<ReservationGroomingEntity> getReseravtionGrooming({String? status});

  Future<ReservationHotelEntity> getReseravtionHotel({String? status});

  Future<bool> updateReseravtionGrooming({
    required String status,
    required int reservationId,
  });

  Future<bool> updateReseravtionHotel({
    required String status,
    required int reservationId,
  });
}

class ReservationGroomingRemoteDateSourceImpl
    extends ReservationGroomingRemoteDataSource {
  final RestClientService restClientService;

  ReservationGroomingRemoteDateSourceImpl(this.restClientService);

  @override
  Future<ReservationGroomingEntity> getReseravtionGrooming(
      {String? status}) async {
    final String branchId = await AuthStorage().readAuthStorage('branchId');
    final fields = {
      'branchId': branchId,
      'status': status ?? "",
    };
    final response = await restClientService.getReservationGrooming(fields);
    if (response.statusCode == 200) {
      final res = response.body as Map<String, dynamic>;
      final resBody = ReservationGroomingEntity.fromJson(res);
      return resBody;
    } else {
      final err = response.error as Map<String, dynamic>;
      throw ServerException(err['message']);
    }
  }

  @override
  Future<bool> updateReseravtionGrooming(
      {required String status, required int reservationId}) async {
    final fields = {
      'reservationId': reservationId,
      'status': status,
    };
    final response = await restClientService.updateReservationStatus(fields);
    if (response.statusCode == 200) {
      return true;
    } else {
      final err = response.error as Map<String, dynamic>;
      throw ServerException(err['message']);
    }
  }

  @override
  Future<ReservationHotelEntity> getReseravtionHotel({String? status}) async {
    final String branchId = await AuthStorage().readAuthStorage('branchId');
    final fields = {
      'branchId': branchId,
      'status': status ?? "",
    };
    final response = await restClientService.getReservationHotel(fields);
    if (response.statusCode == 200) {
      final res = response.body as Map<String, dynamic>;
      final resBody = ReservationHotelEntity.fromJson(res);
      return resBody;
    } else {
      final err = response.error as Map<String, dynamic>;
      throw ServerException(err['message']);
    }
  }

  @override
  Future<bool> updateReseravtionHotel(
      {required String status, required int reservationId}) async {
    final fields = {
      'reservationId': reservationId,
      'status': status,
    };
    final response = await restClientService.updateResHotelStatus(fields);
    if (response.statusCode == 200) {
      return true;
    } else {
      final err = response.error as Map<String, dynamic>;
      throw ServerException(err['message']);
    }
  }
}
