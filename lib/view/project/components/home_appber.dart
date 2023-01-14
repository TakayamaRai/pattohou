import 'package:flutter/material.dart';
import 'package:pattohou/data/color.dart';
import 'package:pattohou/data/common.dart';

Widget homeAppBar(BuildContext context){
  return Column(
    children: [
      Container(
        height: MediaQuery.of(context).padding.top,
        width: MediaQuery.of(context).size.width,
        color:MyColor.primary,
      ),
      Container(
        height: appBarHeight,
        color:Theme.of(context).primaryColor,
        width: MediaQuery.of(context).size.width,
        child: Stack(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: const Icon(Icons.menu,color: Colors.white,size: 30,),
                  onPressed: (){

                },),
              )
              ]),
      ),
    ],
  );
}
