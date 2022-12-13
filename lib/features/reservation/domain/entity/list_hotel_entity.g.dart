// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_hotel_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListHotelEntity _$ListHotelEntityFromJson(Map<String, dynamic> json) =>
    ListHotelEntity(
      json['id'] as int,
      json['cost'] as int,
      json['paymentStatus'] as String,
      json['status'] as String,
      json['ServiceType'] as Map<String, dynamic>,
      json['customer'] as Map<String, dynamic>,
      json['dateCheckIn'] as String,
      json['dateCheckOut'] as String,
      json['PetInRoom'] as List<dynamic>,
    );

Map<String, dynamic> _$ListHotelEntityToJson(ListHotelEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'dateCheckIn': instance.dateIn,
      'dateCheckOut': instance.dateOut,
      'cost': instance.cost,
      'paymentStatus': instance.paymentStatus,
      'status': instance.status,
      'ServiceType': instance.serviceType,
      'customer': instance.customer,
      'PetInRoom': instance.petInRoom,
    };
