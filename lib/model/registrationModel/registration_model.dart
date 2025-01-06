// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'registration_model.freezed.dart'; 
part 'registration_model.g.dart';
@freezed
class RegistrationModel with _$RegistrationModel {
  factory RegistrationModel({
    @Default("") @JsonKey(name: "id") String id,
    @Default("") @JsonKey(name: "customerUniqueId") String customerUniqueId,
    @Default("") @JsonKey(name: "Name") String Name,
    @Default("") @JsonKey(name: "email") String email,
    @Default("") @JsonKey(name: "countryCode") String countryCode,
    @Default("") @JsonKey(name: "phoneNumber") String phoneNumber,
    @Default("") @JsonKey(name: "creationDate") String creationDate,
  }) = _RegistrationModel;

  factory RegistrationModel.fromJson(Map<String, dynamic> json) =>
      _$RegistrationModelFromJson(json);
}
