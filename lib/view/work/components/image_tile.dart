import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pattohou/data/color.dart';
import 'package:pattohou/view/components/text.dart';

class ImageTiles extends StatelessWidget {
  final Map<String,String> items;
  final String selectedKey;
  final Size imageSize;
  final Function(String) onSelected;
  ImageTiles({
    Key? key,
    required this.items,
    required this.selectedKey,
    required this.imageSize,
    required this.onSelected
  }) : super(key: key);
  final text = MyText();

  @override
  Widget build(BuildContext context) {
    List<Widget> list = [];
    items.forEach((title, assetPath) {
      list.add(
          GestureDetector(
            child: imageTile(
                title: title,
                value: selectedKey == title,
                assetPath: assetPath
            ),
            onTap: () => onSelected(title),
          )
      );
    });
    return GridView.count(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: imageSize.width / (imageSize.height + 32),
      crossAxisCount: 2,
      crossAxisSpacing: 5,
      mainAxisSpacing: 5,
      shrinkWrap: true,
      children: list,
    );
  }

  Widget imageTile({
    required String title,
    required bool value,
    required String assetPath}){
    return Container(
      decoration: BoxDecoration(
        color: value ? MyColor.primary.withOpacity(0.2) : Colors.white,
        border: Border.all(
            color: value ? MyColor.primary : MyColor.gray,width: value ? 3 : 1),
      ),
      child: Column(
        children: [
          Image.asset(assetPath),
          text.p16normal(text: title)
        ],
      ),
    );
  }
}
