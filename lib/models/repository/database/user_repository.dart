
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pattohou/data/firebase_auth_eroor.dart';
import 'package:pattohou/data/shared_preference_key.dart';
import 'package:pattohou/models/local/shared_preference.dart';
import 'package:pattohou/models/repository/firebase/firebaseAuth.dart';
import 'package:pattohou/models/repository/firebase/firebaseFirestore.dart';
import 'package:pattohou/models/repository/model/user_model.dart';

final userRepoProvider = Provider.autoDispose<UserRepository>((ref) => UserRepository(ref.read));
final userStreamProvider = StreamProvider.autoDispose<UserModel>((ref) {
  final doc = ref.watch(userRepoProvider).getStreamUser();
  return doc;
});

abstract class BaseUserRepository {
  // User情報をStreamで取得
  Stream<UserModel> getStreamUser();
  // User情報を非同期で取得
  Future<void>getUser();
  // users作成
  Future<void> createUser(UserModel user);
  // userModelをセット
  void setUser(UserModel newUserModel);
  /*
  ・FirebaseAuthのメールアドレス変更
  ・SharedPreferencesのメールアドレス変更
  ・FirebaseStoreのメールアドレス変更
  */
  Future<String> updateEmail({
    required String oldEmail, required String newEmail, required String pass});
  // userModelの削除
  void userModelClear();
}

@override
class UserRepository implements BaseUserRepository {
  final Reader _read;

  UserRepository(this._read);
  static UserModel _userModel = UserModel.empty();
  static UserModel get userModel => _userModel;

  @override
  Stream<UserModel> getStreamUser() {
    final doc = _read(firebaseFirestoreProvider).usersDocRef(AuthRepoProvider.uid);
    final stream = doc.snapshots().map((e) => UserModel.fromDocument(e));
    return stream;
  }

  @override
  Future<void>getUser()async {
    final snap = await _read(firebaseFirestoreProvider)
        .usersDocRef(AuthRepoProvider.uid)
        .get();
    _userModel = UserModel.fromDocument(snap);
  }

  @override
  void setUser(UserModel newUserModel) {
    _userModel = newUserModel;
  }

  @override
  Future<void> createUser(UserModel user) async {
    final readFirestoreProvider = _read(firebaseFirestoreProvider);
    Map<String, dynamic> createDoc = user.toJson();
    createDoc = readFirestoreProvider.setCreateDoc(doc: createDoc,uid: AuthRepoProvider.uid);
    await readFirestoreProvider.usersDocRef(AuthRepoProvider.uid)
        .set(createDoc, SetOptions(merge: true));
  }

  @override
  Future<String> updateEmail({
    required String oldEmail,
    required String newEmail,
    required String pass
  }) async{
    // Authのメールアドレス変更
    FirebaseAuthResultStatus result;
    try {
      await _read(firebaseAuthProvider).signInWithEmailAndPassword(email: oldEmail,password: pass)
          .then((userCredential) {
        userCredential.user!.updateEmail(newEmail);
        userCredential.user!.getIdToken();
        userCredential.user!.sendEmailVerification();
      });
      // デバイスに保存
      SP.setString(SPKeys.email, newEmail);
      //FireStoreのemail更新
      await _read(firebaseFirestoreProvider)
          .usersDocRef(AuthRepoProvider.uid)
          .set(<String, dynamic>{
        'email' : newEmail,
        'updatedAt': FieldValue.serverTimestamp(),
        'updatedUid': AuthRepoProvider.uid,
      }, SetOptions(merge: true));

      result = FirebaseAuthResultStatus.Successful;
    } on FirebaseAuthException catch (e) {
      result = FirebaseAuthExceptionHandler.handleException(e);
      return FirebaseAuthExceptionHandler.exceptionMessage(result);
    }
    return FirebaseAuthExceptionHandler.exceptionMessage(result);
  }

  @override
  void userModelClear(){
    _userModel = UserModel.empty();
  }

}