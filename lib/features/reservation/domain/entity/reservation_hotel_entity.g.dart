// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation_hotel_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReservationHotelEntity _$ReservationHotelEntityFromJson(
        Map<String, dynamic> json) =>
    ReservationHotelEntity(
      json['summary'] as Map<String, dynamic>,
      (json['filters'] as List<dynamic>).map((e) => e as String).toList(),
      (json['hotelReservation'] as List<dynamic>)
          .map((e) => ListHotelEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ReservationHotelEntityToJson(
        ReservationHotelEntity instance) =>
    <String, dynamic>{
      'summary': instance.summary,
      'filters': instance.filters,
      'hotelReservation': instance.listReservationHotel,
    };
