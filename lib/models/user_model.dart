
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';
@JsonSerializable()
class UserModel extends Equatable {
  // ignore: non_constant_identifier_names
  final String id, email, first_name, last_name;
   // ignore: non_constant_identifier_names 
  UserModel({this.id, this.email,this.first_name, this.last_name, });
  @override
  List<Object> get props => [
    id, email, first_name, last_name
  ];
  factory UserModel.fromJson(final json) => _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}