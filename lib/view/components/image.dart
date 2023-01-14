
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pattohou/data/color.dart';
import 'package:pattohou/view/components/text.dart';

class ImageComponent extends StatelessWidget {
  final String? hintText;
  final File? image;
  final Function onAdd;
  final Function(File) onChange;
  final Function(File) onDelete;
  final String errorText;
  final bool isCached;
  final double? height;
  final double? width;

  ImageComponent({
    Key? key,
    this.hintText,
    this.image,
    required this.onAdd,
    required this.onChange,
    required this.onDelete,
    required this.errorText,
    this.isCached = true,
    this.height,
    this.width,
  }) : super(key: key);

  final MyText text = MyText();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        (image == null) ? noImage(context) : imageContents(),
        if (errorText.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 3.0),
            child: text.p14normal(text: errorText, color: MyColor.red),
          ),
      ],
    );
  }

  Widget noImage(BuildContext context) {
    return InkWell(
      onTap: () => onAdd(),
      child: Container(
        height: height ?? MediaQuery.of(context).size.width,
        width: width ?? MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          border: Border.all(color: errorText.isNotEmpty ? MyColor.red : MyColor.gray),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            text.p14bold(text: hintText ?? 'タップして\n写真を追加', color: MyColor.gray),
            const Icon(
              Icons.image_outlined,
              size: 40,
              color: MyColor.gray,
            )
          ],
        ),
      ),
    );
  }

  Widget addImage() {
    return InkWell(
      onTap: onAdd(),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: errorText.isNotEmpty ? MyColor.red : MyColor.gray),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            text.p14bold(text: hintText ?? 'タップして\n写真を追加', color: MyColor.gray),
            const Icon(
              Icons.image_outlined,
              size: 40,
              color: MyColor.gray,
            )
          ],
        ),
      ),
    );
  }

  Widget imageContents() {
    if (image == null) return Container();
    return Container(
      color: Colors.black,
      child: Stack(
        children: [
          Center(
            child: InkWell(
              onTap: ()=> onChange(image!),
              child: isCached ? Image.file(image!) : Image.memory(image!.readAsBytesSync()),
            ),
          ),
          deleteButton(image!),
        ],
      ),
    );
  }

  Widget deleteButton(File image) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: InkWell(
          onTap: ()=> onDelete(image),
          child: Container(
            height: 30,
            width: 30,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: const Center(
              child: Icon(
                Icons.cancel_outlined,
                color: MyColor.red,
                size: 30,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
