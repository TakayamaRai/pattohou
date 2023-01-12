import 'package:flutter/material.dart';
import 'package:pattohou/data/color.dart';
import 'package:pattohou/view/components/button.dart';
import 'package:pattohou/view/components/text.dart';
import 'package:pattohou/view/components/textField.dart';
class AddressComponent extends StatelessWidget {
  final ValueChanged<String>? onChangedPostal;
  final Function() onSearch;
  final void Function(String)? onChangedCityBlock;
  final void Function(String)? onChangedApartment;

  final TextEditingController ctrlPostalCode;
  final String errorPostalCode;

  final TextEditingController ctrlPrefecture;
  final String errorPrefecture;

  final TextEditingController ctrlCityName;
  final String errorCityName;

  final TextEditingController ctrlCityBlock;
  final String errorCityBlock;

  final TextEditingController ctrlApartment;
  final String errorApartment;

  final bool hasRequiredLabel;
  final Color color;

  const AddressComponent({
    super.key,
    required this.onChangedPostal,
    required this.onSearch,
    required this.onChangedCityBlock,
    this.onChangedApartment,

    required this.ctrlPostalCode,
    this.errorPostalCode = '',

    required this.ctrlPrefecture,
    this.errorPrefecture = '',

    required this.ctrlCityName,
    this.errorCityName = '',

    required this.ctrlCityBlock,
    this.errorCityBlock = '',

    required this.ctrlApartment,
    this.errorApartment = '',

    this.hasRequiredLabel = false,

    this.color = MyColor.primary
  });

  @override
  Widget build(BuildContext context) {
    final text = MyText();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //「郵便番号」入力欄
        Padding(
          padding: const EdgeInsets.only(left: 4.0,top:8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(height: 66,child: Center(child: text.p14bold(text: '〒'))),
              Expanded(
                child: Padding(
                    padding: const EdgeInsets.only(left:10.0,right: 24.0),
                    child: MyTextField(title: '郵便番号',hintText: '例：1234567',
                      controller: ctrlPostalCode, errorText: "", onChanged: onChangedPostal,)
                ),
              ),
              ColorButton(name: '住所検索', height: 66.0, width: 138.0,
                  color: color, onPressed: onSearch),
            ],
          ),
        ),
        if(errorPostalCode.isNotEmpty)
          text.p14normal(text: errorPostalCode, color: MyColor.red),
        Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: text.p14normal(text: '＊7桁の郵便番号を入力して「住所検索」ボタンを押すと、都道府県・市区町村が入力されます。')
        ),
        const SizedBox(height: 20.0),
        MyTextField(title: '都道府県', hintText: '例：大阪府',
            controller: ctrlPrefecture,  errorText: errorPrefecture,enabled: false),
        const SizedBox(height: 20.0),
        MyTextField(title: '市区町村', hintText: '例：大阪市北区',
          controller: ctrlCityName,  errorText: errorCityName,enabled: false,),
        const SizedBox(height: 20.0),
        MyTextField(title: '丁目・番地', hintText: '例：1-15',
            controller: ctrlCityBlock,  errorText: errorCityBlock, onChanged: onChangedCityBlock),
        const SizedBox(height: 20.0),
        MyTextField(title: 'ビル・マンション　部屋番号', hintText: '例：〇〇マンション',
            controller: ctrlApartment,  errorText: errorApartment, onChanged: onChangedApartment),

      ],
    );
  }
}
