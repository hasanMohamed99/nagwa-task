import 'package:json_annotation/json_annotation.dart';
part 'api_error_model.g.dart';

@JsonSerializable()
class ApiErrorModel {
  final int? status;
  @JsonKey(name: 'detail')
  final String? message;
  @JsonKey(name: 'status-code')
  final int? statusCode;

  ApiErrorModel({this.status, this.message, this.statusCode});

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) => _$ApiErrorModelFromJson(json);
}
