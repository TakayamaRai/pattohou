// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'work_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WorkModel _$WorkModelFromJson(Map<String, dynamic> json) {
  return _WorkModel.fromJson(json);
}

/// @nodoc
class _$WorkModelTearOff {
  const _$WorkModelTearOff();

  _WorkModel call(
      {int rowId = 0,
      List<String> item = const [],
      String remark = '',
      Map<String, String> images = const {'before': '', 'after': ''}}) {
    return _WorkModel(
      rowId: rowId,
      item: item,
      remark: remark,
      images: images,
    );
  }

  WorkModel fromJson(Map<String, Object?> json) {
    return WorkModel.fromJson(json);
  }
}

/// @nodoc
const $WorkModel = _$WorkModelTearOff();

/// @nodoc
mixin _$WorkModel {
  int get rowId => throw _privateConstructorUsedError;
  List<String> get item => throw _privateConstructorUsedError;
  String get remark => throw _privateConstructorUsedError;
  Map<String, String> get images => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorkModelCopyWith<WorkModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkModelCopyWith<$Res> {
  factory $WorkModelCopyWith(WorkModel value, $Res Function(WorkModel) then) =
      _$WorkModelCopyWithImpl<$Res>;
  $Res call(
      {int rowId,
      List<String> item,
      String remark,
      Map<String, String> images});
}

/// @nodoc
class _$WorkModelCopyWithImpl<$Res> implements $WorkModelCopyWith<$Res> {
  _$WorkModelCopyWithImpl(this._value, this._then);

  final WorkModel _value;
  // ignore: unused_field
  final $Res Function(WorkModel) _then;

  @override
  $Res call({
    Object? rowId = freezed,
    Object? item = freezed,
    Object? remark = freezed,
    Object? images = freezed,
  }) {
    return _then(_value.copyWith(
      rowId: rowId == freezed
          ? _value.rowId
          : rowId // ignore: cast_nullable_to_non_nullable
              as int,
      item: item == freezed
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as List<String>,
      remark: remark == freezed
          ? _value.remark
          : remark // ignore: cast_nullable_to_non_nullable
              as String,
      images: images == freezed
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ));
  }
}

/// @nodoc
abstract class _$WorkModelCopyWith<$Res> implements $WorkModelCopyWith<$Res> {
  factory _$WorkModelCopyWith(
          _WorkModel value, $Res Function(_WorkModel) then) =
      __$WorkModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int rowId,
      List<String> item,
      String remark,
      Map<String, String> images});
}

/// @nodoc
class __$WorkModelCopyWithImpl<$Res> extends _$WorkModelCopyWithImpl<$Res>
    implements _$WorkModelCopyWith<$Res> {
  __$WorkModelCopyWithImpl(_WorkModel _value, $Res Function(_WorkModel) _then)
      : super(_value, (v) => _then(v as _WorkModel));

  @override
  _WorkModel get _value => super._value as _WorkModel;

  @override
  $Res call({
    Object? rowId = freezed,
    Object? item = freezed,
    Object? remark = freezed,
    Object? images = freezed,
  }) {
    return _then(_WorkModel(
      rowId: rowId == freezed
          ? _value.rowId
          : rowId // ignore: cast_nullable_to_non_nullable
              as int,
      item: item == freezed
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as List<String>,
      remark: remark == freezed
          ? _value.remark
          : remark // ignore: cast_nullable_to_non_nullable
              as String,
      images: images == freezed
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WorkModel implements _WorkModel {
  const _$_WorkModel(
      {this.rowId = 0,
      this.item = const [],
      this.remark = '',
      this.images = const {'before': '', 'after': ''}});

  factory _$_WorkModel.fromJson(Map<String, dynamic> json) =>
      _$$_WorkModelFromJson(json);

  @JsonKey()
  @override
  final int rowId;
  @JsonKey()
  @override
  final List<String> item;
  @JsonKey()
  @override
  final String remark;
  @JsonKey()
  @override
  final Map<String, String> images;

  @override
  String toString() {
    return 'WorkModel(rowId: $rowId, item: $item, remark: $remark, images: $images)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WorkModel &&
            const DeepCollectionEquality().equals(other.rowId, rowId) &&
            const DeepCollectionEquality().equals(other.item, item) &&
            const DeepCollectionEquality().equals(other.remark, remark) &&
            const DeepCollectionEquality().equals(other.images, images));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(rowId),
      const DeepCollectionEquality().hash(item),
      const DeepCollectionEquality().hash(remark),
      const DeepCollectionEquality().hash(images));

  @JsonKey(ignore: true)
  @override
  _$WorkModelCopyWith<_WorkModel> get copyWith =>
      __$WorkModelCopyWithImpl<_WorkModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WorkModelToJson(this);
  }
}

abstract class _WorkModel implements WorkModel {
  const factory _WorkModel(
      {int rowId,
      List<String> item,
      String remark,
      Map<String, String> images}) = _$_WorkModel;

  factory _WorkModel.fromJson(Map<String, dynamic> json) =
      _$_WorkModel.fromJson;

  @override
  int get rowId;
  @override
  List<String> get item;
  @override
  String get remark;
  @override
  Map<String, String> get images;
  @override
  @JsonKey(ignore: true)
  _$WorkModelCopyWith<_WorkModel> get copyWith =>
      throw _privateConstructorUsedError;
}
