import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_grooming_entity.g.dart';

@JsonSerializable()
class ListGroomingEntity extends Equatable {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'date')
  final String date;
  @JsonKey(name: 'time')
  final String time;
  @JsonKey(name: 'cost')
  final int cost;
  @JsonKey(name: 'paymentStatus')
  final String paymentStatus;
  @JsonKey(name: 'status')
  final String status;
  @JsonKey(name: 'ServiceType')
  final Map<String, dynamic> serviceType;
  @JsonKey(name: 'customer')
  final Map<String, dynamic> customer;
  @JsonKey(name: 'pet')
  final Map<String, dynamic> pet;

  const ListGroomingEntity(
      this.id,
      this.date,
      this.time,
      this.cost,
      this.paymentStatus,
      this.status,
      this.serviceType,
      this.customer,
      this.pet);

  factory ListGroomingEntity.fromJson(Map<String, dynamic> json) =>
      _$ListGroomingEntityFromJson(json);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
