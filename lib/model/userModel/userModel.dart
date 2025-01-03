

  import 'package:freezed_annotation/freezed_annotation.dart';

part 'userModel.freezed.dart';
part 'userModel.g.dart';

 @Freezed()
class UserModel with _$UserModel {
  // Use a factory constructor here
  const factory UserModel({
    String? name,
     String? id,
  }) = _UserModel;

  // Add the `fromJson` factory method for JSON serialization
  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}

