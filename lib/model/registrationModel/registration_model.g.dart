// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegistrationModelImpl _$$RegistrationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RegistrationModelImpl(
      id: json['id'] as String? ?? "",
      customerUniqueId: json['customerUniqueId'] as String? ?? "",
      Name: json['Name'] as String? ?? "",
      email: json['email'] as String? ?? "",
      countryCode: json['countryCode'] as String? ?? "",
      phoneNumber: json['phoneNumber'] as String? ?? "",
      creationDate: json['creationDate'] as String? ?? "",
    );

Map<String, dynamic> _$$RegistrationModelImplToJson(
        _$RegistrationModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'customerUniqueId': instance.customerUniqueId,
      'Name': instance.Name,
      'email': instance.email,
      'countryCode': instance.countryCode,
      'phoneNumber': instance.phoneNumber,
      'creationDate': instance.creationDate,
    };
