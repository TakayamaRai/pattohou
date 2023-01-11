import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pattohou/data/shared_preference_key.dart';
import 'package:pattohou/models/local/model/sign_in_model.dart';
import 'package:pattohou/models/local/shared_preference.dart';
import 'package:pattohou/models/repository/firebase/firebaseAuth.dart';
import 'package:pattohou/viewmodel/common/validator.dart';

import '../common/loading_viewmodel.dart';

final signInProvider = StateNotifierProvider.autoDispose<SignInNotifier,SignIn>((ref) {
  return SignInNotifier(ref.read);
});

class SignInNotifier extends StateNotifier<SignIn>{
  final Reader _read;

  SignInNotifier(this._read): super(
      SignIn(
          email: SP.getString(SPKeys.email),
          errorEmail: "",
          password: SP.getString(SPKeys.password),
          errorPassword: ""));
  final validator = Validator();

  void clearErrText(){
    state = state.copyWith(errorEmail: "",errorPassword: "");
  }

  void emailValidator({required String email}){
    final errorEmail = validator.checkEmail(email: email);
    state = state.copyWith(email: email,errorEmail: errorEmail);
  }

  void passwordValidator({required String password}){
    final errorPassword = validator.checkPassword(password: password);
    state = state.copyWith(password: password,errorPassword: errorPassword);
  }

  Future<bool> signIn() async {

    final errorEmail = await _read(firebaseAuthRepoProvider)
        .signIn(email: state.email, password: state.password);
    state = state.copyWith(errorEmail: errorEmail);

    if(state.errorEmail =="" && state.errorPassword == ""){
      saveSharedPreferences();
      return true;
    }
    return false;
  }

  Future<bool> signInWithGoogle() async {
    final loading = _read(loadingStatusProvider.notifier)..start();

    final errorEmail = await _read(firebaseAuthRepoProvider)
        .signInWithGoogle();
    state = state.copyWith(errorEmail: errorEmail);

    if(state.errorEmail =="" && state.errorPassword == ""){
      loading.end();
      return true;
    }
    loading.end();
    return false;
  }

  void saveSharedPreferences(){
    SP.setString(SPKeys.email, state.email);
    SP.setString(SPKeys.password, state.password);
  }

  Future<bool>signInWithApple() async{
    final loading = _read(loadingStatusProvider.notifier)..start();

    final errorEmail = await _read(firebaseAuthRepoProvider)
        .signInWithApple();
    state = state.copyWith(errorEmail: errorEmail);

    if(state.errorEmail =="" && state.errorPassword == ""){
      loading.end();
      return true;
    }
    loading.end();
    return false;
  }
}
