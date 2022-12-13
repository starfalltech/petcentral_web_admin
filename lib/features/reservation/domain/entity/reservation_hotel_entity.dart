import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'list_hotel_entity.dart';

part 'reservation_hotel_entity.g.dart';

@JsonSerializable()
class ReservationHotelEntity extends Equatable {
  @JsonKey(name: 'summary')
  final Map<String, dynamic> summary;
  @JsonKey(name: 'filters')
  final List<String> filters;
  @JsonKey(name: 'hotelReservation')
  final List<ListHotelEntity> listReservationHotel;

  const ReservationHotelEntity(
    this.summary,
    this.filters,
    this.listReservationHotel,
  );

  factory ReservationHotelEntity.fromJson(Map<String, dynamic> json) =>
      _$ReservationHotelEntityFromJson(json);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
