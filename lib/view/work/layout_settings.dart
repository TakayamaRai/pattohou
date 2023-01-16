import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pattohou/data/common.dart';
import 'package:pattohou/view/components/button.dart';
import 'package:pattohou/view/components/scroll_view.dart';
import 'package:pattohou/view/components/text.dart';
import 'package:pattohou/view/work/components/image_tile.dart';
import 'package:pattohou/view/work/components/switch_button.dart';
import 'package:pattohou/viewmodel/work/layout_settings.dart';

class LayoutSettings extends HookConsumerWidget {
  LayoutSettings({Key? key}) : super(key: key);
  final text = MyText();
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final vmRead = ref.read(layoutSettingsProvider.notifier);
    final bool hasCover =
    ref.watch(layoutSettingsProvider.select((s) => s.hasCover));
    final bool isVertical =
    ref.watch(layoutSettingsProvider.select((s) => s.isVertical));
    final bool isSets =
    ref.watch(layoutSettingsProvider.select((s) => s.isSets));
    final String itemCount =
    ref.watch(layoutSettingsProvider.select((s) => s.itemCount));
    final String layoutType =
    ref.watch(layoutSettingsProvider.select((s) => s.layoutType));

    return MyScrollView(
        title: "レイアウト設定",
        isBackIcon: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SwitchButton(
                label: "表紙を付ける",
                name: hasCover ? "付ける" : "付けない",
                value: hasCover,
                onPressed: ()=> vmRead.copyWithHasCover(hasCover: !hasCover)),
            const SizedBox(height: 20,),
            SwitchButton(
                label: "報告書の向き",
                name: isVertical ? "縦向き" : "横向き",
                value: isVertical,
                onPressed: ()=> vmRead.copyWithIsVertical(isVertical: !isVertical)),
            const SizedBox(height: 20,),
            SwitchButton(
                label: "写真枚数",
                name: isSets ? "2枚/作業" : "1枚/作業",
                value: isSets,
                onPressed: ()=> vmRead.copyWithIsSets(isSets: !isSets)),
            const SizedBox(height: 20,),
            text.p16bold(text: "作業内容項目数"),
            const SizedBox(height: 10,),
            ImageTiles(
                items: LayoutImages.items,
                selectedKey: itemCount,
                imageSize: const Size(200,100),
                onSelected: (title)=> vmRead.copyWithItemCount(itemCount: title)),
            const SizedBox(height: 20,),
            text.p16bold(text: "レイアウト選択"),
            const SizedBox(height: 10,),
            ImageTiles(
                items: isVertical ? LayoutImages.vertical : LayoutImages.horizontal,
                selectedKey: layoutType,
                imageSize: const Size(200,200),
                onSelected: (title)=> vmRead.copyWithLayoutType(layoutType: title)),
            const SizedBox(height: 40,),
            ColorButton(
                name: "次へ",
                onPressed: () async => _onNext(context: context, ref: ref)),
          ],
        ));
  }

  _onNext({required BuildContext context, required WidgetRef ref}) {
    final vmRead = ref.read(layoutSettingsProvider.notifier);
    vmRead.setPrefs();

  }
}
