import 'package:dartz/dartz.dart';
import 'package:petcentral_web_admin/core/error/failure.dart';
import 'package:petcentral_web_admin/features/reservation/domain/entity/reservation_grooming_entity.dart';
import 'package:petcentral_web_admin/features/reservation/domain/entity/reservation_hotel_entity.dart';

abstract class ReservationRepository {
  Future<Either<Failure, ReservationGroomingEntity>> getReservationGrooming(
      {String? status});

  Future<Either<Failure, bool>> updateReservationGrooming({
    required String status,
    required int reservationId,
  });

  Future<Either<Failure, ReservationHotelEntity>> getReservationHotel(
      {String? status});

  Future<Either<Failure, bool>> updateReservationHotel({
    required String status,
    required int reservationId,
  });
}
