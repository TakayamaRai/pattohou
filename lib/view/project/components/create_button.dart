import 'package:flutter/material.dart';
import 'package:pattohou/data/color.dart';

class CreateButton extends StatelessWidget {
  final Function onPressed;

  const CreateButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: MyColor.red,
        shape: const CircleBorder(),
      ),
      onPressed: () => onPressed(),
      child:const Icon(Icons.add,color: Colors.white,size: 50,),
    );
  }
}