
import 'package:flutter/material.dart';
import 'package:pattohou/data/color.dart';
import 'package:pattohou/view/components/text.dart';

class SwitchButton extends StatelessWidget {
  final String label;
  final String name;
  final bool value;
  final Function onPressed;

  SwitchButton({
    Key? key,
    required this.label,
    required this.name,
    required this.value,
    required this.onPressed,
  }) : super(key: key);

  final text = MyText();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        text.p16bold(text: label),
        SizedBox(
          height: 40,
          width: 120,
          child: TextButton(
            style: OutlinedButton.styleFrom(
              backgroundColor: value ? MyColor.primary : Colors.white,
              side: const BorderSide(color: MyColor.primary,width: 2),
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(6))),
            ),
            onPressed: () {
              onPressed();
            },
            child:
            text.p16bold(text: name,color: value ? Colors.white : MyColor.primary),
          ),
        ),
      ],
    );
  }
}