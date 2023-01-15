import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pattohou/view/components/button.dart';
import 'package:pattohou/view/components/scroll_view.dart';
import 'package:pattohou/view/components/text.dart';
import 'package:pattohou/view/components/textField.dart';
import 'package:pattohou/view/signIn/sgin_up_adrress.dart';
import 'package:pattohou/viewmodel/common/loading_viewmodel.dart';
import 'package:pattohou/viewmodel/signIn/sign_up_viewmodel.dart';

class SignUpBase extends HookConsumerWidget {
  final text = MyText();

  final TextEditingController _ctrlLastName = TextEditingController();
  final TextEditingController _ctrlFirstName = TextEditingController();
  final TextEditingController _ctrlCompanyName = TextEditingController();
  final TextEditingController _ctrlPhoneNumber = TextEditingController();
  final TextEditingController _ctrlFax = TextEditingController();

  SignUpBase({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vmWatch = ref.watch(signUpProvider);
    return MyScrollView(
        isLoading: ref.watch(loadingStatusProvider).isLoading,
        child: Column(
          children: [
            const SizedBox(height: 20,),
            text.p14normal(text: '報告書に記載する情報を入力してください'),
            const SizedBox(height: 20,),
            Row(
              children: [
                MyTextField(
                  title: '姓',
                  hintText: '例) 山田',
                  hasRequiredLabel: true,
                  controller: _ctrlLastName,
                  errorText: vmWatch.errorLastName,
                  width: (MediaQuery.of(context).size.width -80) /2,
                ),
                const SizedBox(width: 20,),
                MyTextField(
                  title: '名',
                  hintText: '例) 太郎',
                  hasRequiredLabel: true,
                  controller: _ctrlFirstName,
                  errorText: vmWatch.errorFirstName,
                  width: (MediaQuery.of(context).size.width -80) /2,
                ),
              ],
            ),
            const SizedBox(height: 20,),
            MyTextField(
              title: '会社名/屋号',
              hintText: '例) 山田株式会社',
              controller: _ctrlCompanyName,
              errorText: "",
            ),
            const SizedBox(height: 20,),
            MyTextField(
              title: '電話番号(ハイフンあり)',
              hintText: '例)06-1234-1234',
              controller: _ctrlPhoneNumber,
              errorText: "",
            ),
            const SizedBox(height: 20,),
            MyTextField(
              title: 'FAX(ハイフンあり)',
              hintText: '例)06-1234-1234',
              controller: _ctrlFax,
              errorText: "",
            ),
            const SizedBox(height: 40,),
            ColorButton(
                name: "次へ",
                onPressed: () async => onNext(context: context, ref: ref)
            ),
          ],
        )
    );
  }

  void onNext({required BuildContext context, required WidgetRef ref}) {
    final vmRead = ref.read(signUpProvider.notifier);
    vmRead.clearErrText();
    vmRead.lastNameValidator(lastName: _ctrlLastName.text);
    vmRead.firstNameValidator(firstName: _ctrlFirstName.text);
    if(vmRead.hasError()) return;

    vmRead.copyWithUserModel(
        lastName:_ctrlLastName.text,
        firstName: _ctrlFirstName.text,
        companyName: _ctrlCompanyName.text,
        phoneNumber: _ctrlPhoneNumber.text,
        fax:_ctrlFax.text
    );
    Navigator.push(
        context,
        MaterialPageRoute<void>(builder: (context){
          return SignUpAddress();
        }));
  }

}
