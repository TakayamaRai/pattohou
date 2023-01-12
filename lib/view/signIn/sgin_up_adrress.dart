import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pattohou/view/components/address.dart';
import 'package:pattohou/view/components/button.dart';
import 'package:pattohou/view/components/scroll_view.dart';
import 'package:pattohou/view/components/text.dart';
import 'package:pattohou/viewmodel/common/loading_viewmodel.dart';
import 'package:pattohou/viewmodel/signIn/sign_up_viewmodel.dart';

class SignUpAddress extends HookConsumerWidget {
  final text = MyText();

  final _ctrlPostalCodeProvider = Provider.autoDispose<TextEditingController>(
      (ref) => TextEditingController());
  final _ctrlPrefectureProvider = Provider.autoDispose<TextEditingController>(
      (ref) => TextEditingController());
  final _ctrlCityNameProvider = Provider.autoDispose<TextEditingController>(
      (ref) => TextEditingController());
  final _ctrlCityBlockProvider = Provider.autoDispose<TextEditingController>(
      (ref) => TextEditingController());
  final TextEditingController _ctrlApartment = TextEditingController();

  SignUpAddress({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vmWatch = ref.watch(signUpProvider);
    return MyScrollView(
        isLoading: ref.watch(loadingStatusProvider).isLoading,
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            text.p14normal(
                text: '報告書に記載する会社情報を入力してください'
                    '後から編集できます(任意)',
                isEllipsis: false),
            const SizedBox(
              height: 20,
            ),
            AddressComponent(
              onChangedPostal: (postalCode) =>
                  _onChangePostalCode(ref: ref, postalCode: postalCode),
              onSearch: () => _onSearch(ref: ref),
              ctrlPostalCode: ref.watch(_ctrlPostalCodeProvider),
              errorPostalCode: vmWatch.errorPostalCode,
              ctrlPrefecture: ref.watch(_ctrlPrefectureProvider),
              errorPrefecture: "",
              ctrlCityName: ref.watch(_ctrlCityNameProvider),
              errorCityName: "",
              ctrlCityBlock: ref.watch(_ctrlCityBlockProvider),
              errorCityBlock: "",
              ctrlApartment: _ctrlApartment,
              errorApartment: "",
              onChangedCityBlock: (String v) {},
            ),
            const SizedBox(
              height: 40,
            ),
            ColorButton(
                name: "次へ",
                onPressed: () async => onNext(context: context, ref: ref)),
          ],
        ));
  }

  void onNext({required BuildContext context, required WidgetRef ref}) {
    final vmRead = ref.read(signUpProvider.notifier);
    vmRead.copyWithAddress(
      postalCode: ref.read(_ctrlPostalCodeProvider).text,
      prefecture: ref.read(_ctrlPrefectureProvider).text,
      cityName: ref.read(_ctrlCityNameProvider).text,
      cityBlock: ref.read(_ctrlCityBlockProvider).text,
      apartment: _ctrlApartment.text,
    );
    print("Error");
  }

  _onChangePostalCode({required WidgetRef ref, required String postalCode}) {
    final vmRead = ref.read(signUpProvider.notifier);
    ref.read(_ctrlPrefectureProvider).text = "";
    ref.read(_ctrlCityNameProvider).text = "";
    vmRead.chkPostalCode(postalCode: postalCode);
  }

  _onSearch({required WidgetRef ref}) async {
    final vmRead = ref.read(signUpProvider.notifier);
    final result = await vmRead.searchAddress(
        postalCode: ref.read(_ctrlPostalCodeProvider).text);
    if (result == null) return;
    ref.read(_ctrlPrefectureProvider).text = result[0];
    ref.read(_ctrlCityNameProvider).text = result[1];
    ref.read(_ctrlCityBlockProvider).text = result[2];
  }
}
