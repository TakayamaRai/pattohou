
import 'package:pattohou/models/repository/model/project_model.dart';

class CreateProject{
  final String errorName;
  final ProjectModel project;
  const CreateProject({required this.errorName, required this.project});

  CreateProject copyWith({String? errorName, ProjectModel? project}){
    return CreateProject(
        errorName: errorName ?? this.errorName,
        project: project ?? this.project);
  }
}