import 'package:dartz/dartz.dart';
import 'package:petcentral_web_admin/core/error/exceptions.dart';
import 'package:petcentral_web_admin/core/error/failure.dart';
import 'package:petcentral_web_admin/features/reservation/data/datasources/reservation_grooming_remote_datasurce.dart';
import 'package:petcentral_web_admin/features/reservation/domain/entity/reservation_grooming_entity.dart';
import 'package:petcentral_web_admin/features/reservation/domain/entity/reservation_hotel_entity.dart';
import 'package:petcentral_web_admin/features/reservation/domain/repositories/reservation_repository.dart';

class ReservationGroomingRepositoryImpl extends ReservationRepository {
  ReservationGroomingRemoteDataSource remoteDataSource;

  ReservationGroomingRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, ReservationGroomingEntity>> getReservationGrooming(
      {String? status}) async {
    try {
      final remoteGrooming =
          await remoteDataSource.getReseravtionGrooming(status: status);
      return Right(remoteGrooming);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.msg));
    }
  }

  @override
  Future<Either<Failure, bool>> updateReservationGrooming(
      {required String status, required int reservationId}) async {
    try {
      final remoteGrooming = await remoteDataSource.updateReseravtionGrooming(
          status: status, reservationId: reservationId);
      return Right(remoteGrooming);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.msg));
    }
  }

  @override
  Future<Either<Failure, ReservationHotelEntity>> getReservationHotel(
      {String? status}) async {
    try {
      final remoteGrooming =
          await remoteDataSource.getReseravtionHotel(status: status);
      return Right(remoteGrooming);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.msg));
    }
  }

  @override
  Future<Either<Failure, bool>> updateReservationHotel(
      {required String status, required int reservationId}) async {
    try {
      final remoteGrooming = await remoteDataSource.updateReseravtionHotel(
          status: status, reservationId: reservationId);
      return Right(remoteGrooming);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.msg));
    }
  }
}
