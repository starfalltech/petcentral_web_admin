import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_entity.g.dart';

@JsonSerializable()
class UserEntity extends Equatable {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'branchId')
  final int branchId;
  @JsonKey(name: 'userId')
  final String userId;
  @JsonKey(name: 'name')
  final String name;

  const UserEntity(this.userId, this.id, this.branchId, this.name);

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
