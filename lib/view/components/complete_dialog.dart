import 'package:flutter/material.dart';
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
