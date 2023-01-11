
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pattohou/data/firebase_auth_eroor.dart';

final firebaseAuthProvider = Provider((ref) => FirebaseAuth.instance);
final firebaseAuthRepoProvider = Provider<AuthRepoProvider>(
        (ref) => AuthRepoProvider(ref.read));

final authStateChangesProvider = StreamProvider<User?>((ref) {
  return ref.read(firebaseAuthProvider).authStateChanges();
});

@override
class AuthRepoProvider {
  final Reader _read;
  const AuthRepoProvider(this._read);

  static String _uid = "";
  static String get uid => _uid;

  User? currentUser() {
    final authUser = _read(firebaseAuthProvider).currentUser;
    if(authUser != null) _uid = authUser.uid;
    return authUser;
  }

  Future<User?> currentUserReload() async{
    await _read(firebaseAuthProvider).currentUser?.reload();
    return currentUser();
  }

  Future<String> signUp({required String email, required String password}) async {
    FirebaseAuthResultStatus result;
    try {
      UserCredential authResult = await _read(firebaseAuthProvider)
          .createUserWithEmailAndPassword(email: email, password: password);
      User? authUser = authResult.user;
      if (authUser != null) {
        result = FirebaseAuthResultStatus.Successful;
        _uid = authUser.uid;
      } else {
        result = FirebaseAuthResultStatus.Undefined;
      }
    } on FirebaseAuthException catch (e) {
      result = FirebaseAuthExceptionHandler.handleException(e);
      return FirebaseAuthExceptionHandler.exceptionMessage(result);
    }
    return FirebaseAuthExceptionHandler.exceptionMessage(result);
  }

  Future<String> signIn({required String email, required String password}) async {
    FirebaseAuthResultStatus result;
    try {
      UserCredential authResult = await _read(firebaseAuthProvider)
          .signInWithEmailAndPassword(email: email, password: password);
      User? authUser = authResult.user;
      if (authUser != null) {
        result = FirebaseAuthResultStatus.Successful;
        _uid = authUser.uid;
      } else {
        result = FirebaseAuthResultStatus.Undefined;
      }
    } on FirebaseAuthException catch (e) {
      result = FirebaseAuthExceptionHandler.handleException(e);
      return FirebaseAuthExceptionHandler.exceptionMessage(result);
    }
    return FirebaseAuthExceptionHandler.exceptionMessage(result);
  }

  Future<String> signInWithGoogle() async {
    FirebaseAuthResultStatus result;
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      final UserCredential authUser =
      await _read(firebaseAuthProvider).signInWithCredential(credential);

      if (authUser.user != null) {
        result = FirebaseAuthResultStatus.Successful;
        _uid = authUser.user!.uid;
      } else {
        result = FirebaseAuthResultStatus.Undefined;
      }
    } on FirebaseAuthException catch (e) {
      result = FirebaseAuthExceptionHandler.handleException(e);
      return FirebaseAuthExceptionHandler.exceptionMessage(result);
    }
    return FirebaseAuthExceptionHandler.exceptionMessage(result);
  }

  Future<String>signInWithApple()async{
    FirebaseAuthResultStatus result;
    try {
      final appleProvider = AppleAuthProvider();
      final UserCredential authUser =
      await _read(firebaseAuthProvider).signInWithProvider(appleProvider);

      if (authUser.user != null) {
        result = FirebaseAuthResultStatus.Successful;
        _uid = authUser.user!.uid;
      } else {
        result = FirebaseAuthResultStatus.Undefined;
      }
    } on FirebaseAuthException catch (e) {
      result = FirebaseAuthExceptionHandler.handleException(e);
      return FirebaseAuthExceptionHandler.exceptionMessage(result);
    }
    return FirebaseAuthExceptionHandler.exceptionMessage(result);

  }

  Future<void> signOut() async {
    await _read(firebaseAuthProvider).signOut();
  }

}