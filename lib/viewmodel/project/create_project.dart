import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pattohou/data/common.dart';
import 'package:pattohou/models/local/model/create_project.dart';
import 'package:pattohou/models/repository/database/project_repository.dart';
import 'package:pattohou/models/repository/firebase/firebaseAuth.dart';
import 'package:pattohou/models/repository/model/project_model.dart';
import 'package:pattohou/viewmodel/common/validator.dart';

final createProjectProvider =
    StateNotifierProvider.autoDispose<CreateProjectNotifier, CreateProject>(
        (ref) {
  return CreateProjectNotifier(ref.read);
});

class CreateProjectNotifier extends StateNotifier<CreateProject> {
  final Reader _read;

  CreateProjectNotifier(this._read)
      : super(CreateProject(errorName: "", project: ProjectModel.empty()));
  final validator = Validator();

  onSelectDate(DateTime newDateTime) {
    state = state.copyWith(
        project: state.project.copyWith(atReportedDate: newDateTime));
  }

  void nameValidator({required String name}) {
    final errorName = validator.checkName(name: name);
    state = state.copyWith(
      errorName: errorName,
    );
  }

  bool hasError() {
    List<String> error = [state.errorName];
    return !error.every((e) => e == "");
  }

  createProject({required String name, required String receiver}) async {
    final atReportedDate = state.project.atReportedDate ?? DateTime.now();
    state = state.copyWith(
        project: state.project.copyWith(
            name: name,
            receiver: receiver,
            atReportedDate: atReportedDate,
            status: ProjectStatus.edit,
            worker: AuthRepoProvider.uid));
    await _read(projectRepoProvider).createProject(project: state.project);
  }
}
