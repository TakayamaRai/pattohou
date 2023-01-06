import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'project_model.freezed.dart';
part 'project_model.g.dart';

/// 新規フィールドを追加したときは@Default('') を入れる
@freezed
class ProjectModel with _$ProjectModel {
  const factory ProjectModel({
    String? projectId,
    @Default("") String name,
    @Default("") String receiver,
    @Default("") String status,
    @Default("") String worker,
    @Default("") String title,
    @Default("") String address1,
    @Default("") String address2,
    @Default("") String workDetails,
    @DateTimeConverter() DateTime? atReportedDate,
  }) = _ProjectModel;

  factory ProjectModel.empty() => const ProjectModel(
    name: "",
    receiver: "",
    status: "",
    worker: "",
    title: "",
    address1: "",
    address2: "",
    workDetails: "",
  );

  factory ProjectModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectModelFromJson(json);

  factory ProjectModel.fromDocument(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return ProjectModel.fromJson(data);
  }
}

class DateTimeConverter implements JsonConverter<DateTime?, Timestamp?> {
  const DateTimeConverter();

  @override
  DateTime? fromJson(Timestamp? json) {
    if(json == null) return null;
    return json.toDate();
  }

  @override
  Timestamp? toJson(DateTime? dateTime) {
    if(dateTime == null) return null;
    return Timestamp.fromDate(dateTime);
  }
}