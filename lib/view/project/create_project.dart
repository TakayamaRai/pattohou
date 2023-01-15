// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pattohou/view/components/button.dart';
import 'package:pattohou/view/components/dialog.dart';
import 'package:pattohou/view/components/scroll_view.dart';
import 'package:pattohou/view/components/text.dart';
import 'package:pattohou/view/components/textField.dart';
import 'package:pattohou/view/project/components/bottom_picker.dart';
import 'package:pattohou/viewmodel/common/format.dart';
import 'package:pattohou/viewmodel/project/create_project.dart';

class CreateProjectPage extends HookConsumerWidget {
  CreateProjectPage({Key? key}) : super(key: key);

  final TextEditingController _ctrlName = TextEditingController();
  final TextEditingController _ctrlReceiver = TextEditingController();
  final text = MyText();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final errorNameState =
        ref.watch(createProjectProvider.select((s) => s.errorName));
    final projectState =
        ref.watch(createProjectProvider.select((s) => s.project));
    final vmRead = ref.watch(createProjectProvider.notifier);
    return MyScrollView(
        title: "新規作成",
        isBackIcon: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyTextField(
              title: '物件名',
              hintText: '例)○○マンション　101号室',
              hasRequiredLabel: true,
              controller: _ctrlName,
              errorText: errorNameState,
            ),
            const SizedBox(height: 20,),
            MyTextField(
              title: '宛先',
              hintText: '例) 山田　太郎様',
              controller: _ctrlReceiver,
              errorText: "",
            ),
            const SizedBox(height: 20,),
            text.p14bold(text: "報告日"),
            const SizedBox(height: 10,),
            BottomPicker().pickerContainer(
                context: context,
                selectMessage: Format()
                    .fmtDate(projectState.atReportedDate ?? DateTime.now()),
                errorMessage: "",
                onPress: () {
                  BottomPicker().showBottomDatePicker(
                      context: context,
                      title: '報告日',
                      initValue: projectState.atReportedDate ?? DateTime.now(),
                      onChange: (newDateTime) =>
                          vmRead.onSelectDate(newDateTime),
                      onComplete: () {
                        Navigator.of(context).pop();
                      });
                }),
            const SizedBox(height: 40,),
            ColorButton(
                name: "完了",
                onPressed: () async => onNext(context: context, ref: ref)),
          ],
        ));
  }

  onNext({required BuildContext context, required WidgetRef ref}) async {
    final vmRead = ref.watch(createProjectProvider.notifier);
    vmRead.nameValidator(name: _ctrlName.text);
    if (vmRead.hasError()) return;
    await vmRead.createProject(name: _ctrlName.text, receiver: _ctrlReceiver.text);
    await showDialog(
      barrierDismissible: false,
      context: context,
      barrierColor: Colors.black.withOpacity(0.8),
      builder: (_) {
        return const CompleteDialog(
          message: "登録が完了しました\n"
              "ホーム画面で報告書を作成してください",
        );
      },
    );
    Navigator.of(context).pop();
  }
}
