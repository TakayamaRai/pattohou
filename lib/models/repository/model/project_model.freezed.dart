// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'project_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProjectModel _$ProjectModelFromJson(Map<String, dynamic> json) {
  return _ProjectModel.fromJson(json);
}

/// @nodoc
class _$ProjectModelTearOff {
  const _$ProjectModelTearOff();

  _ProjectModel call(
      {String? projectId,
      String name = "",
      String receiver = "",
      String status = "",
      String worker = "",
      String title = "",
      String address1 = "",
      String address2 = "",
      String workDetails = "",
      @DateTimeConverter() DateTime? atReportedDate}) {
    return _ProjectModel(
      projectId: projectId,
      name: name,
      receiver: receiver,
      status: status,
      worker: worker,
      title: title,
      address1: address1,
      address2: address2,
      workDetails: workDetails,
      atReportedDate: atReportedDate,
    );
  }

  ProjectModel fromJson(Map<String, Object?> json) {
    return ProjectModel.fromJson(json);
  }
}

/// @nodoc
const $ProjectModel = _$ProjectModelTearOff();

/// @nodoc
mixin _$ProjectModel {
  String? get projectId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get receiver => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get worker => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get address1 => throw _privateConstructorUsedError;
  String get address2 => throw _privateConstructorUsedError;
  String get workDetails => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime? get atReportedDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProjectModelCopyWith<ProjectModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectModelCopyWith<$Res> {
  factory $ProjectModelCopyWith(
          ProjectModel value, $Res Function(ProjectModel) then) =
      _$ProjectModelCopyWithImpl<$Res>;
  $Res call(
      {String? projectId,
      String name,
      String receiver,
      String status,
      String worker,
      String title,
      String address1,
      String address2,
      String workDetails,
      @DateTimeConverter() DateTime? atReportedDate});
}

/// @nodoc
class _$ProjectModelCopyWithImpl<$Res> implements $ProjectModelCopyWith<$Res> {
  _$ProjectModelCopyWithImpl(this._value, this._then);

  final ProjectModel _value;
  // ignore: unused_field
  final $Res Function(ProjectModel) _then;

  @override
  $Res call({
    Object? projectId = freezed,
    Object? name = freezed,
    Object? receiver = freezed,
    Object? status = freezed,
    Object? worker = freezed,
    Object? title = freezed,
    Object? address1 = freezed,
    Object? address2 = freezed,
    Object? workDetails = freezed,
    Object? atReportedDate = freezed,
  }) {
    return _then(_value.copyWith(
      projectId: projectId == freezed
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      receiver: receiver == freezed
          ? _value.receiver
          : receiver // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      worker: worker == freezed
          ? _value.worker
          : worker // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      address1: address1 == freezed
          ? _value.address1
          : address1 // ignore: cast_nullable_to_non_nullable
              as String,
      address2: address2 == freezed
          ? _value.address2
          : address2 // ignore: cast_nullable_to_non_nullable
              as String,
      workDetails: workDetails == freezed
          ? _value.workDetails
          : workDetails // ignore: cast_nullable_to_non_nullable
              as String,
      atReportedDate: atReportedDate == freezed
          ? _value.atReportedDate
          : atReportedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class _$ProjectModelCopyWith<$Res>
    implements $ProjectModelCopyWith<$Res> {
  factory _$ProjectModelCopyWith(
          _ProjectModel value, $Res Function(_ProjectModel) then) =
      __$ProjectModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? projectId,
      String name,
      String receiver,
      String status,
      String worker,
      String title,
      String address1,
      String address2,
      String workDetails,
      @DateTimeConverter() DateTime? atReportedDate});
}

/// @nodoc
class __$ProjectModelCopyWithImpl<$Res> extends _$ProjectModelCopyWithImpl<$Res>
    implements _$ProjectModelCopyWith<$Res> {
  __$ProjectModelCopyWithImpl(
      _ProjectModel _value, $Res Function(_ProjectModel) _then)
      : super(_value, (v) => _then(v as _ProjectModel));

  @override
  _ProjectModel get _value => super._value as _ProjectModel;

  @override
  $Res call({
    Object? projectId = freezed,
    Object? name = freezed,
    Object? receiver = freezed,
    Object? status = freezed,
    Object? worker = freezed,
    Object? title = freezed,
    Object? address1 = freezed,
    Object? address2 = freezed,
    Object? workDetails = freezed,
    Object? atReportedDate = freezed,
  }) {
    return _then(_ProjectModel(
      projectId: projectId == freezed
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      receiver: receiver == freezed
          ? _value.receiver
          : receiver // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      worker: worker == freezed
          ? _value.worker
          : worker // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      address1: address1 == freezed
          ? _value.address1
          : address1 // ignore: cast_nullable_to_non_nullable
              as String,
      address2: address2 == freezed
          ? _value.address2
          : address2 // ignore: cast_nullable_to_non_nullable
              as String,
      workDetails: workDetails == freezed
          ? _value.workDetails
          : workDetails // ignore: cast_nullable_to_non_nullable
              as String,
      atReportedDate: atReportedDate == freezed
          ? _value.atReportedDate
          : atReportedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProjectModel with DiagnosticableTreeMixin implements _ProjectModel {
  const _$_ProjectModel(
      {this.projectId,
      this.name = "",
      this.receiver = "",
      this.status = "",
      this.worker = "",
      this.title = "",
      this.address1 = "",
      this.address2 = "",
      this.workDetails = "",
      @DateTimeConverter() this.atReportedDate});

  factory _$_ProjectModel.fromJson(Map<String, dynamic> json) =>
      _$$_ProjectModelFromJson(json);

  @override
  final String? projectId;
  @JsonKey()
  @override
  final String name;
  @JsonKey()
  @override
  final String receiver;
  @JsonKey()
  @override
  final String status;
  @JsonKey()
  @override
  final String worker;
  @JsonKey()
  @override
  final String title;
  @JsonKey()
  @override
  final String address1;
  @JsonKey()
  @override
  final String address2;
  @JsonKey()
  @override
  final String workDetails;
  @override
  @DateTimeConverter()
  final DateTime? atReportedDate;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProjectModel(projectId: $projectId, name: $name, receiver: $receiver, status: $status, worker: $worker, title: $title, address1: $address1, address2: $address2, workDetails: $workDetails, atReportedDate: $atReportedDate)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProjectModel'))
      ..add(DiagnosticsProperty('projectId', projectId))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('receiver', receiver))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('worker', worker))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('address1', address1))
      ..add(DiagnosticsProperty('address2', address2))
      ..add(DiagnosticsProperty('workDetails', workDetails))
      ..add(DiagnosticsProperty('atReportedDate', atReportedDate));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProjectModel &&
            const DeepCollectionEquality().equals(other.projectId, projectId) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.receiver, receiver) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.worker, worker) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.address1, address1) &&
            const DeepCollectionEquality().equals(other.address2, address2) &&
            const DeepCollectionEquality()
                .equals(other.workDetails, workDetails) &&
            const DeepCollectionEquality()
                .equals(other.atReportedDate, atReportedDate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(projectId),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(receiver),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(worker),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(address1),
      const DeepCollectionEquality().hash(address2),
      const DeepCollectionEquality().hash(workDetails),
      const DeepCollectionEquality().hash(atReportedDate));

  @JsonKey(ignore: true)
  @override
  _$ProjectModelCopyWith<_ProjectModel> get copyWith =>
      __$ProjectModelCopyWithImpl<_ProjectModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProjectModelToJson(this);
  }
}

abstract class _ProjectModel implements ProjectModel {
  const factory _ProjectModel(
      {String? projectId,
      String name,
      String receiver,
      String status,
      String worker,
      String title,
      String address1,
      String address2,
      String workDetails,
      @DateTimeConverter() DateTime? atReportedDate}) = _$_ProjectModel;

  factory _ProjectModel.fromJson(Map<String, dynamic> json) =
      _$_ProjectModel.fromJson;

  @override
  String? get projectId;
  @override
  String get name;
  @override
  String get receiver;
  @override
  String get status;
  @override
  String get worker;
  @override
  String get title;
  @override
  String get address1;
  @override
  String get address2;
  @override
  String get workDetails;
  @override
  @DateTimeConverter()
  DateTime? get atReportedDate;
  @override
  @JsonKey(ignore: true)
  _$ProjectModelCopyWith<_ProjectModel> get copyWith =>
      throw _privateConstructorUsedError;
}
