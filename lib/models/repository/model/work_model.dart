import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'work_model.freezed.dart';
part 'work_model.g.dart';

/// 新規フィールドを追加したときは@Default('') を入れる
@freezed
class WorkModel with _$WorkModel {
  const factory WorkModel({
    @Default(0) int rowId,
    @Default([]) List<String> item,
    @Default('') String remark,
    @Default({'before':'','after':''}) Map<String,String> images,
  }) = _WorkModel;

  factory WorkModel.empty() => const WorkModel(
      rowId:0,
      item:[],
      remark: '',
      images:{'before':'','after':''}
  );

  factory WorkModel.fromJson(Map<String, dynamic> json) =>
      _$WorkModelFromJson(json);

  factory WorkModel.fromDocument(
      DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return WorkModel.fromJson(data);
  }
}
