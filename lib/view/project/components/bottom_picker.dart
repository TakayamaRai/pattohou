import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pattohou/data/color.dart';
import 'package:pattohou/view/components/text.dart';

class BottomPicker{
  final text = MyText();
  Widget pickerContainer(
      {required BuildContext context,
        required String selectMessage,
        required String errorMessage,
        required Function() onPress}) {
    return Column(
      children: [
        Container(
          height: 50.0,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(6.0)),
            border: errorMessage.isEmpty
                ? Border.all(color: MyColor.gray, width: 1.0)
                : Border.all(color: MyColor.red, width: 1.0),
          ),
          child: Stack(
            children: <Widget>[
              const Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      color: MyColor.gray,
                      size: 30.0,
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                      child: text.p14normal(
                          text: selectMessage.isEmpty ? '未選択' : selectMessage,
                          color: selectMessage.isEmpty
                              ? MyColor.gray
                              : Colors.black)),
                ),
              ),
              InkWell(
                onTap: () {
                  onPress();
                },
              ),
            ],
          ),
        ),
        if (errorMessage.isNotEmpty)
          Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: text.p14bold(text: errorMessage,color: MyColor.red),
              )),
      ],
    );
  }

  void showBottomDatePicker({
    required BuildContext context,
    required String title,
    required DateTime initValue,
    required Function(DateTime) onChange,
    required Function() onComplete, }){
    showCupertinoModalPopup<void>(
      context: context,
      builder: (context) {
        return Stack(
          children: <Widget>[
            buildBottomPicker(
              MediaQuery.of(context).size.height * 0.4,
              CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                initialDateTime: initValue,
                onDateTimeChanged: (newDateTime) => onChange(newDateTime),
              ),
            ),
            bottomPickerHeader(
                context: context,
                title: title,
                onComplete:() => onComplete()
            )
          ],
        );
      },
    );
  }


  Widget bottomPickerHeader({required BuildContext context, required String title, required Function() onComplete}){
    return Container(
      height: 48.0,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left:16.0),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'キャンセル',
                      style:
                      const TextStyle(fontSize: 14.0,color: MyColor.bottomSheetHeaderText,fontWeight: FontWeight.w300),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context).pop();
                        },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Material(child: Center(child: text.p14bold(text: title))),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right:16.0),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '完了',
                      style:
                      const TextStyle(fontSize: 14.0,color: MyColor.bottomSheetHeaderText,fontWeight: FontWeight.w600),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          onComplete();
                        },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget buildBottomPicker(double height,Widget picker) {
    return Container(
      height: height,
      padding: const EdgeInsets.only(top: 0.0),
      color: CupertinoColors.white,
      child: DefaultTextStyle(
        style: const TextStyle(
          color: CupertinoColors.black,
          fontSize: 22.0,
        ),
        child: GestureDetector(
          // Blocks taps from propagating to the modal sheet and popping.
          onTap: () {},
          child: SafeArea(
            top: false,
            child: picker,
          ),
        ),
      ),
    );
  }
}