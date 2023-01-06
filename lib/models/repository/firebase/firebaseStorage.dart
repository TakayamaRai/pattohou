import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


final firebaseStorageProvider = Provider((ref) => FirebaseStorage.instance);
final firebaseStorageRepoProvider = Provider<FirebaseStorageRepositoryProvider>(
        (ref) => FirebaseStorageRepositoryProvider(ref.read));

@override
class FirebaseStorageRepositoryProvider {
  final Reader _read;
  const FirebaseStorageRepositoryProvider(this._read);

  Future<String> toUrl(String fileName) async{
    try{
      Reference ref = _read(firebaseStorageProvider).ref().child(fileName);
      final String url = (await ref.getDownloadURL());
      return url;
    }catch(e){
      print('get URL err: $e');
      return '';
    }
  }
  UploadTask putFile({required File file,required String fileName}){
    return _read(firebaseStorageProvider).ref().child(fileName).putFile(file);
  }
}

extension FirebaseStorageX on FirebaseStorage {
  String usersPath({required String uid}) {
    return 'users/$uid';
  }
  String projectsPath({required String uid,required String projectId}) {
    return '${usersPath(uid: uid)}/projects/$projectId';
  }
}