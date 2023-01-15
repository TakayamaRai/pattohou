import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pattohou/view/components/button.dart';
import 'package:pattohou/view/components/dialog.dart';
import 'package:pattohou/view/components/image.dart';
import 'package:pattohou/view/components/image_bottom_sheet.dart';
import 'package:pattohou/view/components/scroll_view.dart';
import 'package:pattohou/view/components/text.dart';
import 'package:pattohou/view/project/home.dart';
import 'package:pattohou/viewmodel/common/loading_viewmodel.dart';
import 'package:pattohou/viewmodel/common/logo_viewmodel.dart';
import 'package:pattohou/viewmodel/signIn/sign_up_viewmodel.dart';

class SignUpLogo extends HookConsumerWidget {
  final text = MyText();

  SignUpLogo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fileState = ref.watch(logoStatusProvider.select((s) => s.file));
    return MyScrollView(
        isLoading: ref.watch(loadingStatusProvider).isLoading,
        child: Column(
          children: [
            const SizedBox(height: 20,),
            text.p14normal(text: '報告書に挿入する自社のロゴを選択してください'
                '(.pngとjpgのみ)'
                '後から編集できます(任意)',isEllipsis: false),
            const SizedBox(height: 20,),
            ImageComponent(
              errorText: '',
              image: fileState,
              onAdd: () async => await _setImage(context: context, ref: ref),
              onChange: (oldImage) async => _setImage(context: context, ref: ref),
              onDelete: (image) async => _onDelete(context, ref,image),
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

  onNext({required BuildContext context, required WidgetRef ref}) async{
    final vmRead = ref.read(signUpProvider.notifier);
    final loading = ref.read(loadingStatusProvider.notifier)..start("ユーザー登録中");
    await vmRead.createUser();
    loading.end();
    await showDialog(
      barrierDismissible: false,
      context: context,
      barrierColor: Colors.black.withOpacity(0.8),
      builder: (_) {
        return const CompleteDialog(
          message: "ユーザー登録が完了しました",
        );
      },
    );
    if (!context.mounted) return;
    await Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute<bool>(
            builder: (_) => Home()),(_)=>false);
  }

  Future<void> _setImage({required BuildContext context,required WidgetRef ref}) async {
    final loading = ref.read(loadingStatusProvider.notifier)..start();
    final source = await ImageBottomSheet().show(context);
    if (source == null) return;
    // ローカルに写真を保存する処理
    await ref.read(logoStatusProvider.notifier).writeImage(source: source);
    loading.end();
  }

  _onDelete(BuildContext context, WidgetRef ref, File image) {
    showDialog(
      barrierDismissible: false,
      context: context,
      barrierColor: Colors.black.withOpacity(0.8),
      builder: (_) {
        return MyDeleteAlertDialog(
          mainText: "ロゴを削除しますか？",
          primaryButtonText: "削除",
          secondaryButtonText: "キャンセル",
          function: () async {
            final loading = ref.read(loadingStatusProvider.notifier)..start();
            await ref.read(logoStatusProvider.notifier).deleteImage();
            await image.delete();
            loading.end();
          },
        );
      },
    );
  }

}
