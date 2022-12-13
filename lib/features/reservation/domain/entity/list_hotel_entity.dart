import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_hotel_entity.g.dart';

@JsonSerializable()
class ListHotelEntity extends Equatable {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'dateCheckIn')
  final String dateIn;
  @JsonKey(name: 'dateCheckOut')
  final String dateOut;
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
  @JsonKey(name: 'PetInRoom')
  final List petInRoom;

  const ListHotelEntity(
      this.id,
      this.cost,
      this.paymentStatus,
      this.status,
      this.serviceType,
      this.customer,
      this.dateIn,
      this.dateOut,
      this.petInRoom);

  factory ListHotelEntity.fromJson(Map<String, dynamic> json) =>
      _$ListHotelEntityFromJson(json);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
