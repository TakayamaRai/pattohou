// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WorkModel _$$_WorkModelFromJson(Map<String, dynamic> json) => _$_WorkModel(
      rowId: json['rowId'] as int? ?? 0,
      item:
          (json['item'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      remark: json['remark'] as String? ?? '',
      images: (json['images'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String),
          ) ??
          const {'before': '', 'after': ''},
    );

Map<String, dynamic> _$$_WorkModelToJson(_$_WorkModel instance) =>
    <String, dynamic>{
      'rowId': instance.rowId,
      'item': instance.item,
      'remark': instance.remark,
      'images': instance.images,
    };
