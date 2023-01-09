import 'package:flutter/material.dart';

class MyText{

  Widget p10normal({required String text, Color? color,bool? isEllipsis}){
    return Text(text,style: TextStyle(
        color: color ?? Colors.black,
        fontSize: 10.0,
        fontWeight: FontWeight.w300,
        overflow: (isEllipsis ?? true) ? TextOverflow.ellipsis : TextOverflow.clip),);
  }

  Widget p10bold({required String text, Color? color,bool? isEllipsis}){
    return Text(text,style: TextStyle(
        color: color ?? Colors.black,
        fontSize: 10.0,
        fontWeight: FontWeight.w600,
        overflow: (isEllipsis ?? true) ? TextOverflow.ellipsis : TextOverflow.clip),);
  }

  Widget p12normal({required String text, Color? color,bool? isEllipsis}){
    return Text(text,style: TextStyle(
        color: color ?? Colors.black,
        fontSize: 12.0,
        fontWeight: FontWeight.w300,
        overflow: (isEllipsis ?? true) ? TextOverflow.ellipsis : TextOverflow.clip),);
  }

  Widget p12bold({required String text, Color? color,bool? isEllipsis}){
    return Text(text,style: TextStyle(
        color: color ?? Colors.black,
        fontSize: 12.0,
        fontWeight: FontWeight.w600,
        overflow: (isEllipsis ?? true) ? TextOverflow.ellipsis : TextOverflow.clip),);
  }

  Widget p14normal({required String text, Color? color,bool? isEllipsis}){
    return Text(text,style: TextStyle(
        color: color ?? Colors.black,
        fontSize: 14.0,
        fontWeight: FontWeight.w300,
        overflow: (isEllipsis ?? true) ? TextOverflow.ellipsis : TextOverflow.clip),);
  }

  Widget p14bold({required String text, Color? color,bool? isEllipsis}){
    return Text(text,style: TextStyle(
        color: color ?? Colors.black,
        fontSize: 14.0,
        fontWeight: FontWeight.w600,
        overflow: (isEllipsis ?? true) ? TextOverflow.ellipsis : TextOverflow.clip),);
  }

  Widget p16normal({required String text, Color? color,bool? isEllipsis}){
    return Text(text,style: TextStyle(
        color: color ?? Colors.black,
        fontSize: 16.0,
        fontWeight: FontWeight.w300,
        overflow: (isEllipsis ?? true) ? TextOverflow.ellipsis : TextOverflow.clip),);
  }

  Widget p16bold({required String text, Color? color,bool? isEllipsis}){
    return Text(text,style: TextStyle(
        color: color ?? Colors.black,
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
        overflow: (isEllipsis ?? true) ? TextOverflow.ellipsis : TextOverflow.clip),);
  }
}