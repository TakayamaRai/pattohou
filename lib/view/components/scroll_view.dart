import 'package:flutter/material.dart';
import 'package:pattohou/data/color.dart';
import 'package:pattohou/data/common.dart';
import 'package:pattohou/view/components/load_dialog.dart';
import 'package:pattohou/view/components/text.dart';

class MyScrollView extends StatelessWidget {
  final String? title;
  final bool? isBackIcon;
  final Widget child;
  final double? vertical;
  final double? horizontal;
  final bool? isLoading;
  final String? loadingText;
  const MyScrollView({
    this.title,
    this.isBackIcon,
    this.vertical,
    this.horizontal,
    this.isLoading,
    this.loadingText,
    required this.child
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: MyColor.background,
      body: Stack(
        children: [
          if(title != null) appBar(context, isBackIcon ?? false, title ?? ""),
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + appBarHeight),
            child: SingleChildScrollView(
                child: SafeArea(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: vertical ?? 20.0,horizontal: horizontal ?? 30.0),
                    child: child,
                  ),
                )
            ),
          ),
          if(isLoading??false)
            Loading().dialog(message: loadingText??"お待ちください"),
        ],
      ),
    );
  }

  Widget appBar(BuildContext context, bool isBackIcon, String title){
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
          child: Stack(children: [
            if(isBackIcon)
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    height: 40.0,
                    width: 40.0,
                    child: IconButton(
                      padding: const EdgeInsets.all(0),
                      icon: const Icon(Icons.chevron_left,color: Colors.white,size: 40.0,),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),
              ),
            Align(
              alignment: Alignment.center,
              child: MyText().p16bold(text: title,color: Colors.white)
            )
          ]),
        ),
      ],
    );
  }
}
