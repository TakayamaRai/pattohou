import 'package:flutter/material.dart';
import 'package:pattohou/data/color.dart';


class RequiredLabel extends StatelessWidget {
  const RequiredLabel({
    super.key,
    this.width,
    this.height,
    this.labelTitle,
  });

  final double? width;
  final double? height;
  final String? labelTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: MyColor.primary, borderRadius: BorderRadius.circular(5.0)),
      width: width ?? 40.0,
      height: height ?? 20.0,
      alignment: Alignment.center,
      child: Text(
        labelTitle ?? "必須",
        style: const TextStyle(color: Colors.white, fontSize: 12.0),
      ),
    );
  }
}
