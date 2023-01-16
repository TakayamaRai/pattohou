
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pattohou/data/shared_preference_key.dart';
import 'package:pattohou/models/local/model/layout_setting.dart';
import 'package:pattohou/models/local/utils/shared_preference.dart';

final layoutSettingsProvider =
StateNotifierProvider.autoDispose<LayoutSettingsNotifier, LayoutSetting>((ref) {
  return LayoutSettingsNotifier(ref.read);
});

class LayoutSettingsNotifier extends StateNotifier<LayoutSetting> {
  final Reader _read;

  LayoutSettingsNotifier(this._read): super(
      LayoutSetting(
          hasCover: SP.getBool(SPKeys.hasCover) ?? true,
          isVertical: SP.getBool(SPKeys.isVertical) ?? true,
          isSets: SP.getBool(SPKeys.isSets) ?? true,
          itemCount: SP.getString(SPKeys.itemCount),
          layoutType: SP.getString(SPKeys.layoutType),
      ));

  void copyWith(
      {bool? hasCover,
        bool? isVertical,
        bool? isSets,
        String? itemCount,
        String? layoutType}) {
    state.copyWith(
      hasCover: hasCover ?? state.hasCover,
      isVertical: isVertical ?? state.isVertical,
      isSets: isSets ?? state.isSets,
      itemCount: itemCount ?? state.itemCount,
      layoutType: layoutType ?? state.layoutType,
    );
  }

  void copyWithHasCover({required bool hasCover}) {
    state = state.copyWith(hasCover: hasCover);
  }

  copyWithIsVertical({required bool isVertical}) {
    state = state.copyWith(isVertical: isVertical);
  }

  copyWithIsSets({required bool isSets}) {
    state = state.copyWith(isSets: isSets);
  }

  copyWithItemCount({required String itemCount}) {
    state = state.copyWith(itemCount: itemCount);
  }

  copyWithLayoutType({required String layoutType}) {
    state = state.copyWith(layoutType: layoutType);
  }

  setPrefs() {
    SP.setBool(SPKeys.hasCover, state.hasCover);
    SP.setBool(SPKeys.isVertical, state.isVertical);
    SP.setBool(SPKeys.isSets, state.isSets);
    SP.setString(SPKeys.itemCount, state.itemCount);
    SP.setString(SPKeys.layoutType, state.layoutType);
  }

}