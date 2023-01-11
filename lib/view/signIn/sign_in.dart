import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pattohou/data/color.dart';
import 'package:pattohou/view/components/button.dart';
import 'package:pattohou/view/components/scroll_view.dart';
import 'package:pattohou/view/components/text.dart';
import 'package:pattohou/view/components/textField.dart';
import 'package:pattohou/view/signIn/sign_up_base.dart';
import 'package:pattohou/viewmodel/common/loading_viewmodel.dart';
import 'package:pattohou/viewmodel/signIn/sign_in_viewmodel.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class SignInPage extends HookConsumerWidget {
  SignInPage({Key? key}) : super(key: key);
  final TextEditingController _ctrlEmail = TextEditingController();
  final TextEditingController _ctrlPassword = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vmWatch = ref.watch(signInProvider);

    return MyScrollView(
      isLoading: ref.watch(loadingStatusProvider).isLoading,
      child: Column(
          children: [
            if(Platform.isIOS)
              SignInButton(
                Buttons.Apple,
                text: "Apple IDで続ける",
                onPressed: () => onSignInWithApple(context: context, ref: ref),
              ),
            if(Platform.isAndroid)
              SignInButton(
                Buttons.Google,
                text: "Googleで続ける",
                onPressed: () => onSignInWithGoogle(context: context, ref: ref),
              ),
            const SizedBox(height: 20,),
            MyText().p14normal(text: "または",color: MyColor.gray),
            const SizedBox(height: 20,),
            MyTextField(
                controller: _ctrlEmail,
                keyboardType: TextInputType.emailAddress,
                title: "メールアドレス",
                hintText: "メールアドレス",
                errorText: vmWatch.errorEmail
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: MyTextField(
                controller: _ctrlPassword,
                title: "パスワード",
                hintText: "半角英数６〜２０文字以内",
                errorText: vmWatch.errorPassword,
              ),
            ),
            const SizedBox(height: 40,),
            ColorButton(
                name: "ログイン",
                onPressed: () async => onSignIn(
                    context: context, ref: ref,
                    email: _ctrlEmail.text, password: _ctrlPassword.text)
            ),
            const SizedBox(height: 20,),
            OutLineButton(
              name: "新規会員登録（無料）",
              height: 50,
              width: MediaQuery.of(context).size.width,
              onPressed: () => onSignUp(context: context),
            ),
          ],
      ),);
  }

  Future<void> onSignIn({required BuildContext context, required WidgetRef ref,required String email, required String password})async {
    final vmRead = ref.read(signInProvider.notifier);
    final loading = ref.read(loadingStatusProvider.notifier)..start();
    vmRead.clearErrText();
    vmRead.emailValidator(email: email);
    vmRead.passwordValidator(password: password);
    final isSuccess = await vmRead.signIn();
    if(isSuccess){
      print('サインイン成功');
    }
    loading.end();
    // await Navigator.of(context).pushAndRemoveUntil(
    //     MaterialPageRoute<bool>(
    //         builder: (_) => Splash()),(_)=>false);
  }

  onSignInWithGoogle({required BuildContext context,required WidgetRef ref}) async{
    final vmRead = ref.read(signInProvider.notifier);
    final loading = ref.read(loadingStatusProvider.notifier)..start();
    final isSuccess = await vmRead.signInWithGoogle();
    if(!isSuccess){
      loading.end();
      return;
    }
    await vmRead.getUser();
    if(vmRead.isExistUser()){
      print('サインイン成功');
    }
    if (!context.mounted) return;
    await Navigator.push(
        context,
        MaterialPageRoute<void>(builder: (context){
          return SignUpBase();
        }));
    loading.end();
  }

  onSignInWithApple({required BuildContext context,required WidgetRef ref}) async{
    final vmRead = ref.read(signInProvider.notifier);
    final loading = ref.read(loadingStatusProvider.notifier)..start();

    final isSuccess = await vmRead.signInWithApple();
    if(!isSuccess){
      loading.end();
      return;
    }

    await vmRead.getUser();

    if(vmRead.isExistUser()){
      print('サインイン成功');
    }
    if (!context.mounted) return;
    await Navigator.push(
        context,
        MaterialPageRoute<void>(builder: (context){
          return SignUpBase();
        }));
    loading.end();
  }

  void onSignUp({required BuildContext context}){
    Navigator.push(
        context,
        MaterialPageRoute<void>(builder: (context){
          return SignUpBase();
        }));
  }

}

