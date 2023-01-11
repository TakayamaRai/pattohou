// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      lastName: json['lastName'] as String? ?? '',
      firstName: json['firstName'] as String? ?? '',
      companyName: json['companyName'] as String? ?? '',
      phoneNumber: json['phoneNumber'] as String? ?? '',
      fax: json['fax'] as String? ?? '',
      logoUrl: json['logoUrl'] as String? ?? '',
      projectCount: json['projectCount'] as int? ?? 0,
      address: json['address'] == null
          ? const AddressModel()
          : AddressModel.fromJson(json['address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'lastName': instance.lastName,
      'firstName': instance.firstName,
      'companyName': instance.companyName,
      'phoneNumber': instance.phoneNumber,
      'fax': instance.fax,
      'logoUrl': instance.logoUrl,
      'projectCount': instance.projectCount,
      'address': instance.address.toJson(),
    };

_$_AddressModel _$$_AddressModelFromJson(Map<String, dynamic> json) =>
    _$_AddressModel(
      postalCode: json['postalCode'] as String? ?? "",
      prefecture: json['prefecture'] as String? ?? "",
      cityName: json['cityName'] as String? ?? "",
      cityBlock: json['cityBlock'] as String? ?? "",
      apartment: json['apartment'] as String? ?? "",
    );

Map<String, dynamic> _$$_AddressModelToJson(_$_AddressModel instance) =>
    <String, dynamic>{
      'postalCode': instance.postalCode,
      'prefecture': instance.prefecture,
      'cityName': instance.cityName,
      'cityBlock': instance.cityBlock,
      'apartment': instance.apartment,
    };
