
import 'package:flutter/material.dart';
import 'package:pattohou/data/color.dart';
import 'package:pattohou/view/components/label.dart';
import 'package:pattohou/view/components/text.dart';

class MyTextFieldWithLabel extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? title;
  final String? message;
  final String? hintText;
  final bool? enabled;
  final String errorText;
  final bool? hasRequiredLabel;
  final bool obscureText;
  final ValueChanged<String>? onChanged;
  final FocusNode? focusNode;

  const MyTextFieldWithLabel({
    Key? key,
    this.controller,
    this.keyboardType,
    this.title,
    this.message,
    this.hintText,
    this.enabled,
    required this.errorText,
    this.obscureText = false,
    this.hasRequiredLabel,
    this.onChanged,
    this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyText text = MyText();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: (hasRequiredLabel ?? false)
                ? Wrap(
              runSpacing: 5.0,
              children: [
                text.p14bold(text: title ?? ''),
                const SizedBox(width: 10.0),
                const RequiredLabel(),
              ],
            )
                : text.p14bold(text: title ?? ''),
          ),
        if (message != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: text.p14normal(text: message!),
          ),
        ColoredBox(
          color: Colors.white,
          child: TextFormField(
            controller: controller,
            keyboardType: keyboardType ?? TextInputType.text,
            focusNode: focusNode,
            enabled: enabled ?? true,
            obscureText: obscureText,
            decoration: InputDecoration(
              filled: !(enabled ?? true),
              fillColor: MyColor.gray,
              hintText: hintText ?? '',
              hintStyle: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300),
              enabledBorder: OutlineInputBorder(
                borderSide: errorText.isEmpty ? const BorderSide(color: MyColor.gray, width: 1.0) : const BorderSide(color: MyColor.red, width: 1.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: errorText.isEmpty ? const BorderSide(color: MyColor.gray, width: 1.0) : const BorderSide(color: MyColor.red, width: 1.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: errorText.isEmpty ? const BorderSide(color: MyColor.gray, width: 1.0) : const BorderSide(color: MyColor.red, width: 1.0),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: errorText.isEmpty ? const BorderSide(color: MyColor.gray, width: 1.0) : const BorderSide(color: MyColor.red, width: 1.0),
              ),
            ),
            onChanged: onChanged,
          ),
        ),
        if (errorText.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 3.0),
            child: text.p14normal(text: errorText, color: MyColor.gray),
          ),
      ],
    );
  }
}