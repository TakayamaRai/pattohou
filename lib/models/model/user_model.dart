import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  @JsonSerializable(explicitToJson: true)
  const factory UserModel({
    @Default('') String lastName,
    @Default('') String firstName,
    @Default('') String companyName,
    @Default('') String phoneNumber,
    @Default('') String fax,
    @Default('') String logoUrl,
    @Default(0) int projectCount,
    @Default(AddressModel()) AddressModel address,
  }) = _UserModel;

  factory UserModel.empty() => const UserModel(
    lastName: '',
    firstName: '',
    companyName: '',
    phoneNumber: '',
    fax: '',
    logoUrl: '',
    projectCount: 0
  );

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  factory UserModel.fromDocument(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return UserModel.fromJson(data);
  }
}


@freezed
class AddressModel with _$AddressModel {
  const factory AddressModel({
    @Default("") String postalCode,
    @Default("") String prefecture,
    @Default("") String cityName,
    @Default("") String cityBlock,
    @Default("") String apartment,
  }) = _AddressModel;

  factory AddressModel.empty() => const AddressModel(
    postalCode: "",
    prefecture: "",
    cityName: "",
    cityBlock: "",
    apartment: "",
  );

  factory AddressModel.fromJson(Map<String, dynamic> json) => _$AddressModelFromJson(json);
}