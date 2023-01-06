
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final firebaseFirestoreProvider = Provider((ref) => FirebaseFirestore.instance);

extension FirebaseFirestoreX on FirebaseFirestore {
  /// users
  CollectionReference<Map<String, dynamic>> usersCollectionRef() => collection('users');

  DocumentReference<Map<String, dynamic>> usersDocRef(String uid) => usersCollectionRef().doc(uid);

  /// projects
  CollectionReference<Map<String, dynamic>> projectsCollectionRef() => collection('projects');

  DocumentReference<Map<String, dynamic>> projectsDocRef(String projectId) => projectsCollectionRef().doc(projectId);

  /// works
  CollectionReference<Map<String, dynamic>> worksCollectionRef(String projectId) => projectsCollectionRef().doc(projectId).collection('works');

  DocumentReference<Map<String, dynamic>> worksDocRef(String projectId, String markerId) => worksCollectionRef(projectId).doc(markerId);

  /// ドキュメント
  Map<String, dynamic> setCreateDoc(Map<String, dynamic> createDoc, String uid) {
    createDoc.addAll({
      'createdAt': FieldValue.serverTimestamp(),
      'createdUid': uid,
      'updatedAt': FieldValue.serverTimestamp(),
      'updatedUid': uid,
    });
    return createDoc;
  }

  Map<String, dynamic> setUpdateDoc(Map<String, dynamic> createDoc, String uid) {
    createDoc.addAll({
      'updatedAt': FieldValue.serverTimestamp(),
      'updatedUid': uid,
    });
    return createDoc;
  }

}