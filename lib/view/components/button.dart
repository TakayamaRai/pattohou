
import 'package:flutter/material.dart';
import 'package:pattohou/data/color.dart';
import 'package:pattohou/view/components/text.dart';

class ColorButton extends StatelessWidget {
  final String name;
  final double? height;
  final double? width;
  final double? left;
  final double? top;
  final double? right;
  final double? bottom;
  final Color? color;
  final Color? textColor;
  final Function onPressed;

  const ColorButton({
    Key? key,
    required this.name,
    this.height,
    this.width,
    this.left,
    this.top,
    this.right,
    this.bottom,
    this.color,
    this.textColor = Colors.white,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: left ?? 0, top: top ?? 0, right: right ?? 0, bottom: bottom ?? 0),
      child: SizedBox(
        height: height ?? 50,
        width: width ?? MediaQuery.of(context).size.width,
        child: TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(color ?? MyColor.primary),
            ),
            child: MyText().p16bold(text: name,color: textColor),
            onPressed: () {
              onPressed();
            }),
      ),
    );
  }
}

class DisableButton extends StatelessWidget {
  final String name;
  final double? height;
  final double? width;
  final double? left;
  final double? top;
  final double? right;
  final double? bottom;
  final Color? color;
  final Function onPressed;

  const DisableButton({
    Key? key,
    required this.name,
    this.height,
    this.width,
    this.left,
    this.top,
    this.right,
    this.bottom,
    this.color,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyText text = MyText();
    return Padding(
      padding: EdgeInsets.only(left: left ?? 0, top: top ?? 0, right: right ?? 0, bottom: bottom ?? 0),
      child: SizedBox(
        height: height,
        width: width,
        child: TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(color ?? MyColor.gray),
            ),
            child: text.p16bold(text: name, color: Colors.white),
            onPressed: () {
              onPressed();
            }),
      ),
    );
  }
}

class OutLineButton extends StatelessWidget {
  final String name;
  final double? height;
  final double? width;
  final double? left;
  final double? top;
  final double? right;
  final double? bottom;
  final Color? color;
  final Function onPressed;

  const OutLineButton({
    Key? key,
    required this.name,
    this.height,
    this.width,
    this.left,
    this.top,
    this.right,
    this.bottom,
    this.color,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: left ?? 0, top: top ?? 0, right: right ?? 0, bottom: bottom ?? 0),
      child: SizedBox(
        height: height,
        width: width,
        child: TextButton(
          style: OutlinedButton.styleFrom(
            foregroundColor: color ?? MyColor.primary,
            backgroundColor: Colors.white,
            side: BorderSide(color: color ?? MyColor.primary),
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(6))),
          ),
          onPressed: () {
            onPressed();
          },
          child:
          MyText().p16bold(text: name,color: color ?? MyColor.primary),
          ),
        ),
    );
  }
}


class IconColorButton extends StatelessWidget {
  final String name;
  final double? height;
  final double? width;
  final double? left;
  final double? top;
  final double? right;
  final double? bottom;
  final Color? color;
  final Color? textColor;
  final IconData iconData;
  final double? iconSize;
  final Function onPressed;

  const IconColorButton({
    Key? key,
    required this.name,
    this.height,
    this.width,
    this.left,
    this.top,
    this.right,
    this.bottom,
    this.color,
    this.textColor = Colors.white,
    required this.iconData,
    this.iconSize,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: left ?? 0, top: top ?? 0, right: right ?? 0, bottom: bottom ?? 0),
      child: SizedBox(
        height: height ?? 50,
        width: width ?? MediaQuery.of(context).size.width,
        child: TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(color ?? MyColor.primary),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(iconData, size: iconSize,color: textColor,),
                const SizedBox(width: 6.0),
                MyText().p16bold(text: name,color: textColor),
              ],
            ),
            onPressed: () {
              onPressed();
            }),
      ),
    );
  }
}