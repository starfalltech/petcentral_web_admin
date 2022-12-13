// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_grooming_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListGroomingEntity _$ListGroomingEntityFromJson(Map<String, dynamic> json) =>
    ListGroomingEntity(
      json['id'] as int,
      json['date'] as String,
      json['time'] as String,
      json['cost'] as int,
      json['paymentStatus'] as String,
      json['status'] as String,
      json['ServiceType'] as Map<String, dynamic>,
      json['customer'] as Map<String, dynamic>,
      json['pet'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$ListGroomingEntityToJson(ListGroomingEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'time': instance.time,
      'cost': instance.cost,
      'paymentStatus': instance.paymentStatus,
      'status': instance.status,
      'ServiceType': instance.serviceType,
      'customer': instance.customer,
      'pet': instance.pet,
    };
