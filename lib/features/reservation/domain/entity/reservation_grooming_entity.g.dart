// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation_grooming_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReservationGroomingEntity _$ReservationGroomingEntityFromJson(
        Map<String, dynamic> json) =>
    ReservationGroomingEntity(
      json['summary'] as Map<String, dynamic>,
      (json['filters'] as List<dynamic>).map((e) => e as String).toList(),
      (json['groomingReservation'] as List<dynamic>)
          .map((e) => ListGroomingEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ReservationGroomingEntityToJson(
        ReservationGroomingEntity instance) =>
    <String, dynamic>{
      'summary': instance.summary,
      'filters': instance.filters,
      'groomingReservation': instance.listReservationGrooming,
    };
