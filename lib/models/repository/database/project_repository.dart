
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pattohou/models/repository/firebase/firebaseAuth.dart';
import 'package:pattohou/models/repository/firebase/firebaseFirestore.dart';
import 'package:pattohou/models/repository/model/project_model.dart';
import 'package:pattohou/models/repository/model/work_model.dart';

final projectRepoProvider = Provider.autoDispose<ProjectRepository>((ref) => ProjectRepository(ref.read));

final projectStreamProvider = StreamProvider.autoDispose<Map<String ,ProjectModel>>((ref) {
  return ref.watch(projectRepoProvider).getStreamProject();
});

final projectStreamDocProvider = StreamProvider.autoDispose.family<ProjectModel,String>((ref,projectId) {
  return ref.watch(projectRepoProvider).getStreamDocProject(projectId);
});

final workStreamProvider = StreamProvider.autoDispose.family<List<WorkModel>,String>((ref,projectId) {
  return ref.watch(projectRepoProvider).getStreamWork(projectId);
});

abstract class BaseProjectRepository {
  // Project情報をStreamで取得
  Stream<Map<String ,ProjectModel>> getStreamProject();
  // workerがuidのProject情報をStreamで取得
  Stream<ProjectModel> getStreamDocProject(String projectId);
  // jsonをStream<Map<String ,ProjectModel>>に変換
  Stream<Map<String ,ProjectModel>> fromJson(Query query);
  // projectを新規作成
  Future<void> createProject({required ProjectModel project});
  // projectを更新
  Future<void> updateProject({required String id, required ProjectModel project});
  // ProjectIdの施工内容をStreamで取得
  Stream<List<WorkModel>> getStreamWork(String projectId);
  // jsonをStream<List<WorkModel>>に変換
  Stream<List<WorkModel>> workFromJson(Query query);
  // projectを新規作成
  Future<void> createWork({required String projectId,required WorkModel work});
  // projectを更新
  Future<void> updateWork({required String projectId, required String workId,required WorkModel work});
}

@override
class ProjectRepository implements BaseProjectRepository {
  final Reader _read;

  ProjectRepository(this._read);
  final now = DateTime.now();

  @override
  Stream<Map<String ,ProjectModel>> getStreamProject() {
    Query query = _read(firebaseFirestoreProvider).projectsCollectionRef();
    query = query
        .where('worker', isEqualTo: AuthRepoProvider.uid)
        .orderBy('createdAt', descending: true);
    return fromJson(query);
  }

  @override
  Stream<ProjectModel> getStreamDocProject(String projectId) {
    final doc = _read(firebaseFirestoreProvider).projectsDocRef(projectId);
    return doc.snapshots().map((e) {
      ProjectModel result = ProjectModel.fromDocument(e);
      return result;
    });
  }

  @override
  Stream<Map<String, ProjectModel>> fromJson(Query query) {
    return query.snapshots().map((e) {
      Map<String, ProjectModel> map = {};
      e.docs.map((e) {
        final result = ProjectModel.fromJson(e.data() as Map<String, dynamic>);
        return {e.id: result};
      }).forEach((element) {
        map.addAll(element);
      });
      return map;
    });
  }

  @override
  Future<void> createProject({required ProjectModel project}) async{
    final readFirestoreProvider = _read(firebaseFirestoreProvider);
    Map<String, dynamic> createDoc = project.toJson();
    createDoc = readFirestoreProvider.setCreateDoc(doc: createDoc,uid: AuthRepoProvider.uid);
    await readFirestoreProvider.projectsCollectionRef().doc()
        .set(createDoc, SetOptions(merge: true));
  }

  @override
  Future<void> updateProject({required String id, required ProjectModel project}) async{
    final readFirestoreProvider = _read(firebaseFirestoreProvider);
    Map<String, dynamic> createDoc = project.toJson();
    createDoc = readFirestoreProvider.setCreateDoc(doc: createDoc,uid: AuthRepoProvider.uid);
    await readFirestoreProvider.projectsDocRef(id)
        .set(createDoc, SetOptions(merge: true));
  }


  @override
  Stream<List<WorkModel>> getStreamWork(String projectId) {
    Query query = _read(firebaseFirestoreProvider).worksCollectionRef(projectId);
    query = query.orderBy('rowId');
    return workFromJson(query);
  }

  @override
  Stream<List<WorkModel>> workFromJson(Query query){
    final stream = query.snapshots().map(
          (e) => e.docs.map((e) {
        return WorkModel.fromJson(e.data() as Map<String, dynamic>);
      }).toList(),
    );
    return stream;
  }

  @override
  Future<void> createWork({required String projectId,required WorkModel work})async{
    final readFirestoreProvider = _read(firebaseFirestoreProvider);
    Map<String, dynamic> createDoc = work.toJson();
    createDoc = readFirestoreProvider.setCreateDoc(doc: createDoc,uid: AuthRepoProvider.uid);
    await readFirestoreProvider.worksCollectionRef(projectId).doc()
        .set(createDoc, SetOptions(merge: true));
  }

  @override
  Future<void> updateWork({required String projectId, required String workId,required WorkModel work})async{
    final readFirestoreProvider = _read(firebaseFirestoreProvider);
    Map<String, dynamic> createDoc = work.toJson();
    createDoc = readFirestoreProvider.setCreateDoc(doc: createDoc,uid: AuthRepoProvider.uid);
    await readFirestoreProvider.worksDocRef(projectId,workId)
        .set(createDoc, SetOptions(merge: true));
  }

}