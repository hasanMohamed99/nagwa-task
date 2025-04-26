// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_error_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiErrorModel _$ApiErrorModelFromJson(Map<String, dynamic> json) =>
    ApiErrorModel(
      status: (json['status'] as num?)?.toInt(),
      message: json['detail'] as String?,
      statusCode: (json['status-code'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ApiErrorModelToJson(ApiErrorModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'detail': instance.message,
      'status-code': instance.statusCode,
    };
