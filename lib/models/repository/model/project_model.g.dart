// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProjectModel _$$_ProjectModelFromJson(Map<String, dynamic> json) =>
    _$_ProjectModel(
      projectId: json['projectId'] as String?,
      name: json['name'] as String? ?? "",
      receiver: json['receiver'] as String? ?? "",
      status: json['status'] as String? ?? "",
      worker: json['worker'] as String? ?? "",
      title: json['title'] as String? ?? "",
      address1: json['address1'] as String? ?? "",
      address2: json['address2'] as String? ?? "",
      workDetails: json['workDetails'] as String? ?? "",
      atReportedDate: const DateTimeConverter()
          .fromJson(json['atReportedDate'] as Timestamp?),
    );

Map<String, dynamic> _$$_ProjectModelToJson(_$_ProjectModel instance) =>
    <String, dynamic>{
      'projectId': instance.projectId,
      'name': instance.name,
      'receiver': instance.receiver,
      'status': instance.status,
      'worker': instance.worker,
      'title': instance.title,
      'address1': instance.address1,
      'address2': instance.address2,
      'workDetails': instance.workDetails,
      'atReportedDate':
          const DateTimeConverter().toJson(instance.atReportedDate),
    };
