import 'package:flutter/material.dart';
import 'package:pattohou/data/color.dart';
import 'package:pattohou/view/components/button.dart';
import 'package:pattohou/view/components/text.dart';

class CompleteDialog extends StatelessWidget {
  final String message;
  const CompleteDialog({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyText text = MyText();
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset("assets/complete.png"),
          const SizedBox(height: 10,),
          text.p12normal(text: message),
          const SizedBox(height: 10,),
          DisableButton(
            name: "閉じる",
            width: MediaQuery.of(context).size.width,
            onPressed: ()=> Navigator.of(context).pop(),)
        ],
      ),
    );
  }
}

class MyDeleteAlertDialog extends StatelessWidget {
  final String mainText;
  final String? secondText;
  final String primaryButtonText;
  final String secondaryButtonText;
  final Function function;

  const MyDeleteAlertDialog({
    Key? key,
    required this.mainText,
    this.secondText,
    required this.primaryButtonText,
    required this.secondaryButtonText,
    required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyText text = MyText();

    return Stack(
      children: [
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              text.p18bold(text: mainText, color: Colors.white),
              if (secondText != null) text.p18bold(text: secondText!, color: Colors.white),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconColorButton(
                  name: primaryButtonText,
                  iconData: Icons.delete_outline,
                  color: MyColor.red,
                  onPressed: () {
                    function();
                    Navigator.pop(context);
                  }),
              const SizedBox(height: 15.0),
              ColorButton(name: secondaryButtonText,color: MyColor.gray, onPressed: () => Navigator.pop(context)),
            ],
          ),
        )
      ],
    );
  }
}
