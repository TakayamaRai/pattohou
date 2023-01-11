// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
class _$UserModelTearOff {
  const _$UserModelTearOff();

  _UserModel call(
      {String lastName = '',
      String firstName = '',
      String companyName = '',
      String phoneNumber = '',
      String fax = '',
      String logoUrl = '',
      int projectCount = 0,
      AddressModel address = const AddressModel()}) {
    return _UserModel(
      lastName: lastName,
      firstName: firstName,
      companyName: companyName,
      phoneNumber: phoneNumber,
      fax: fax,
      logoUrl: logoUrl,
      projectCount: projectCount,
      address: address,
    );
  }

  UserModel fromJson(Map<String, Object?> json) {
    return UserModel.fromJson(json);
  }
}

/// @nodoc
const $UserModel = _$UserModelTearOff();

/// @nodoc
mixin _$UserModel {
  String get lastName => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get companyName => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String get fax => throw _privateConstructorUsedError;
  String get logoUrl => throw _privateConstructorUsedError;
  int get projectCount => throw _privateConstructorUsedError;
  AddressModel get address => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res>;
  $Res call(
      {String lastName,
      String firstName,
      String companyName,
      String phoneNumber,
      String fax,
      String logoUrl,
      int projectCount,
      AddressModel address});

  $AddressModelCopyWith<$Res> get address;
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res> implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  final UserModel _value;
  // ignore: unused_field
  final $Res Function(UserModel) _then;

  @override
  $Res call({
    Object? lastName = freezed,
    Object? firstName = freezed,
    Object? companyName = freezed,
    Object? phoneNumber = freezed,
    Object? fax = freezed,
    Object? logoUrl = freezed,
    Object? projectCount = freezed,
    Object? address = freezed,
  }) {
    return _then(_value.copyWith(
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      companyName: companyName == freezed
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      fax: fax == freezed
          ? _value.fax
          : fax // ignore: cast_nullable_to_non_nullable
              as String,
      logoUrl: logoUrl == freezed
          ? _value.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      projectCount: projectCount == freezed
          ? _value.projectCount
          : projectCount // ignore: cast_nullable_to_non_nullable
              as int,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as AddressModel,
    ));
  }

  @override
  $AddressModelCopyWith<$Res> get address {
    return $AddressModelCopyWith<$Res>(_value.address, (value) {
      return _then(_value.copyWith(address: value));
    });
  }
}

/// @nodoc
abstract class _$UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$UserModelCopyWith(
          _UserModel value, $Res Function(_UserModel) then) =
      __$UserModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String lastName,
      String firstName,
      String companyName,
      String phoneNumber,
      String fax,
      String logoUrl,
      int projectCount,
      AddressModel address});

  @override
  $AddressModelCopyWith<$Res> get address;
}

/// @nodoc
class __$UserModelCopyWithImpl<$Res> extends _$UserModelCopyWithImpl<$Res>
    implements _$UserModelCopyWith<$Res> {
  __$UserModelCopyWithImpl(_UserModel _value, $Res Function(_UserModel) _then)
      : super(_value, (v) => _then(v as _UserModel));

  @override
  _UserModel get _value => super._value as _UserModel;

  @override
  $Res call({
    Object? lastName = freezed,
    Object? firstName = freezed,
    Object? companyName = freezed,
    Object? phoneNumber = freezed,
    Object? fax = freezed,
    Object? logoUrl = freezed,
    Object? projectCount = freezed,
    Object? address = freezed,
  }) {
    return _then(_UserModel(
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      companyName: companyName == freezed
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      fax: fax == freezed
          ? _value.fax
          : fax // ignore: cast_nullable_to_non_nullable
              as String,
      logoUrl: logoUrl == freezed
          ? _value.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      projectCount: projectCount == freezed
          ? _value.projectCount
          : projectCount // ignore: cast_nullable_to_non_nullable
              as int,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as AddressModel,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_UserModel with DiagnosticableTreeMixin implements _UserModel {
  const _$_UserModel(
      {this.lastName = '',
      this.firstName = '',
      this.companyName = '',
      this.phoneNumber = '',
      this.fax = '',
      this.logoUrl = '',
      this.projectCount = 0,
      this.address = const AddressModel()});

  factory _$_UserModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserModelFromJson(json);

  @JsonKey()
  @override
  final String lastName;
  @JsonKey()
  @override
  final String firstName;
  @JsonKey()
  @override
  final String companyName;
  @JsonKey()
  @override
  final String phoneNumber;
  @JsonKey()
  @override
  final String fax;
  @JsonKey()
  @override
  final String logoUrl;
  @JsonKey()
  @override
  final int projectCount;
  @JsonKey()
  @override
  final AddressModel address;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserModel(lastName: $lastName, firstName: $firstName, companyName: $companyName, phoneNumber: $phoneNumber, fax: $fax, logoUrl: $logoUrl, projectCount: $projectCount, address: $address)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserModel'))
      ..add(DiagnosticsProperty('lastName', lastName))
      ..add(DiagnosticsProperty('firstName', firstName))
      ..add(DiagnosticsProperty('companyName', companyName))
      ..add(DiagnosticsProperty('phoneNumber', phoneNumber))
      ..add(DiagnosticsProperty('fax', fax))
      ..add(DiagnosticsProperty('logoUrl', logoUrl))
      ..add(DiagnosticsProperty('projectCount', projectCount))
      ..add(DiagnosticsProperty('address', address));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserModel &&
            const DeepCollectionEquality().equals(other.lastName, lastName) &&
            const DeepCollectionEquality().equals(other.firstName, firstName) &&
            const DeepCollectionEquality()
                .equals(other.companyName, companyName) &&
            const DeepCollectionEquality()
                .equals(other.phoneNumber, phoneNumber) &&
            const DeepCollectionEquality().equals(other.fax, fax) &&
            const DeepCollectionEquality().equals(other.logoUrl, logoUrl) &&
            const DeepCollectionEquality()
                .equals(other.projectCount, projectCount) &&
            const DeepCollectionEquality().equals(other.address, address));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(lastName),
      const DeepCollectionEquality().hash(firstName),
      const DeepCollectionEquality().hash(companyName),
      const DeepCollectionEquality().hash(phoneNumber),
      const DeepCollectionEquality().hash(fax),
      const DeepCollectionEquality().hash(logoUrl),
      const DeepCollectionEquality().hash(projectCount),
      const DeepCollectionEquality().hash(address));

  @JsonKey(ignore: true)
  @override
  _$UserModelCopyWith<_UserModel> get copyWith =>
      __$UserModelCopyWithImpl<_UserModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserModelToJson(this);
  }
}

abstract class _UserModel implements UserModel {
  const factory _UserModel(
      {String lastName,
      String firstName,
      String companyName,
      String phoneNumber,
      String fax,
      String logoUrl,
      int projectCount,
      AddressModel address}) = _$_UserModel;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$_UserModel.fromJson;

  @override
  String get lastName;
  @override
  String get firstName;
  @override
  String get companyName;
  @override
  String get phoneNumber;
  @override
  String get fax;
  @override
  String get logoUrl;
  @override
  int get projectCount;
  @override
  AddressModel get address;
  @override
  @JsonKey(ignore: true)
  _$UserModelCopyWith<_UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

AddressModel _$AddressModelFromJson(Map<String, dynamic> json) {
  return _AddressModel.fromJson(json);
}

/// @nodoc
class _$AddressModelTearOff {
  const _$AddressModelTearOff();

  _AddressModel call(
      {String postalCode = "",
      String prefecture = "",
      String cityName = "",
      String cityBlock = "",
      String apartment = ""}) {
    return _AddressModel(
      postalCode: postalCode,
      prefecture: prefecture,
      cityName: cityName,
      cityBlock: cityBlock,
      apartment: apartment,
    );
  }

  AddressModel fromJson(Map<String, Object?> json) {
    return AddressModel.fromJson(json);
  }
}

/// @nodoc
const $AddressModel = _$AddressModelTearOff();

/// @nodoc
mixin _$AddressModel {
  String get postalCode => throw _privateConstructorUsedError;
  String get prefecture => throw _privateConstructorUsedError;
  String get cityName => throw _privateConstructorUsedError;
  String get cityBlock => throw _privateConstructorUsedError;
  String get apartment => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddressModelCopyWith<AddressModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressModelCopyWith<$Res> {
  factory $AddressModelCopyWith(
          AddressModel value, $Res Function(AddressModel) then) =
      _$AddressModelCopyWithImpl<$Res>;
  $Res call(
      {String postalCode,
      String prefecture,
      String cityName,
      String cityBlock,
      String apartment});
}

/// @nodoc
class _$AddressModelCopyWithImpl<$Res> implements $AddressModelCopyWith<$Res> {
  _$AddressModelCopyWithImpl(this._value, this._then);

  final AddressModel _value;
  // ignore: unused_field
  final $Res Function(AddressModel) _then;

  @override
  $Res call({
    Object? postalCode = freezed,
    Object? prefecture = freezed,
    Object? cityName = freezed,
    Object? cityBlock = freezed,
    Object? apartment = freezed,
  }) {
    return _then(_value.copyWith(
      postalCode: postalCode == freezed
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String,
      prefecture: prefecture == freezed
          ? _value.prefecture
          : prefecture // ignore: cast_nullable_to_non_nullable
              as String,
      cityName: cityName == freezed
          ? _value.cityName
          : cityName // ignore: cast_nullable_to_non_nullable
              as String,
      cityBlock: cityBlock == freezed
          ? _value.cityBlock
          : cityBlock // ignore: cast_nullable_to_non_nullable
              as String,
      apartment: apartment == freezed
          ? _value.apartment
          : apartment // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$AddressModelCopyWith<$Res>
    implements $AddressModelCopyWith<$Res> {
  factory _$AddressModelCopyWith(
          _AddressModel value, $Res Function(_AddressModel) then) =
      __$AddressModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String postalCode,
      String prefecture,
      String cityName,
      String cityBlock,
      String apartment});
}

/// @nodoc
class __$AddressModelCopyWithImpl<$Res> extends _$AddressModelCopyWithImpl<$Res>
    implements _$AddressModelCopyWith<$Res> {
  __$AddressModelCopyWithImpl(
      _AddressModel _value, $Res Function(_AddressModel) _then)
      : super(_value, (v) => _then(v as _AddressModel));

  @override
  _AddressModel get _value => super._value as _AddressModel;

  @override
  $Res call({
    Object? postalCode = freezed,
    Object? prefecture = freezed,
    Object? cityName = freezed,
    Object? cityBlock = freezed,
    Object? apartment = freezed,
  }) {
    return _then(_AddressModel(
      postalCode: postalCode == freezed
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String,
      prefecture: prefecture == freezed
          ? _value.prefecture
          : prefecture // ignore: cast_nullable_to_non_nullable
              as String,
      cityName: cityName == freezed
          ? _value.cityName
          : cityName // ignore: cast_nullable_to_non_nullable
              as String,
      cityBlock: cityBlock == freezed
          ? _value.cityBlock
          : cityBlock // ignore: cast_nullable_to_non_nullable
              as String,
      apartment: apartment == freezed
          ? _value.apartment
          : apartment // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AddressModel with DiagnosticableTreeMixin implements _AddressModel {
  const _$_AddressModel(
      {this.postalCode = "",
      this.prefecture = "",
      this.cityName = "",
      this.cityBlock = "",
      this.apartment = ""});

  factory _$_AddressModel.fromJson(Map<String, dynamic> json) =>
      _$$_AddressModelFromJson(json);

  @JsonKey()
  @override
  final String postalCode;
  @JsonKey()
  @override
  final String prefecture;
  @JsonKey()
  @override
  final String cityName;
  @JsonKey()
  @override
  final String cityBlock;
  @JsonKey()
  @override
  final String apartment;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AddressModel(postalCode: $postalCode, prefecture: $prefecture, cityName: $cityName, cityBlock: $cityBlock, apartment: $apartment)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AddressModel'))
      ..add(DiagnosticsProperty('postalCode', postalCode))
      ..add(DiagnosticsProperty('prefecture', prefecture))
      ..add(DiagnosticsProperty('cityName', cityName))
      ..add(DiagnosticsProperty('cityBlock', cityBlock))
      ..add(DiagnosticsProperty('apartment', apartment));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AddressModel &&
            const DeepCollectionEquality()
                .equals(other.postalCode, postalCode) &&
            const DeepCollectionEquality()
                .equals(other.prefecture, prefecture) &&
            const DeepCollectionEquality().equals(other.cityName, cityName) &&
            const DeepCollectionEquality().equals(other.cityBlock, cityBlock) &&
            const DeepCollectionEquality().equals(other.apartment, apartment));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(postalCode),
      const DeepCollectionEquality().hash(prefecture),
      const DeepCollectionEquality().hash(cityName),
      const DeepCollectionEquality().hash(cityBlock),
      const DeepCollectionEquality().hash(apartment));

  @JsonKey(ignore: true)
  @override
  _$AddressModelCopyWith<_AddressModel> get copyWith =>
      __$AddressModelCopyWithImpl<_AddressModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AddressModelToJson(this);
  }
}

abstract class _AddressModel implements AddressModel {
  const factory _AddressModel(
      {String postalCode,
      String prefecture,
      String cityName,
      String cityBlock,
      String apartment}) = _$_AddressModel;

  factory _AddressModel.fromJson(Map<String, dynamic> json) =
      _$_AddressModel.fromJson;

  @override
  String get postalCode;
  @override
  String get prefecture;
  @override
  String get cityName;
  @override
  String get cityBlock;
  @override
  String get apartment;
  @override
  @JsonKey(ignore: true)
  _$AddressModelCopyWith<_AddressModel> get copyWith =>
      throw _privateConstructorUsedError;
}
