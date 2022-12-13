import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'list_grooming_entity.dart';

part 'reservation_grooming_entity.g.dart';

@JsonSerializable()
class ReservationGroomingEntity extends Equatable {
  @JsonKey(name: 'summary')
  final Map<String, dynamic> summary;
  @JsonKey(name: 'filters')
  final List<String> filters;
  @JsonKey(name: 'groomingReservation')
  final List<ListGroomingEntity> listReservationGrooming;

  const ReservationGroomingEntity(
    this.summary,
    this.filters,
    this.listReservationGrooming,
  );

  factory ReservationGroomingEntity.fromJson(Map<String, dynamic> json) =>
      _$ReservationGroomingEntityFromJson(json);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
