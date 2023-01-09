import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Loading {
  Widget dialog({required String message}) {
    return Container(
      color: Colors.black.withOpacity(0.3),
      child: CupertinoAlertDialog(
        title: Text(message),
        content: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
