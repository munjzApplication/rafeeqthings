// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'personal_model.freezed.dart';
part 'personal_model.g.dart';

@freezed
class Personalmodel with _$Personalmodel {
  factory Personalmodel({
    @Default('') @JsonKey(name: 'token') String token,
    @Default('') @JsonKey(name: 'error') String error,
  }) = _Personalmodel;

  factory Personalmodel.fromJson(Map<String, dynamic> json) =>
      _$PersonalmodelFromJson(json);
}
