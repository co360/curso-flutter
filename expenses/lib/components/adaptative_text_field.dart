import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeTextField extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String) onSubmitted;
  final TextInputType inputType;
  //final InputDecoration inputDecoration;
  //final BoxDecoration boxDecoration;
  final String label;

  AdaptativeTextField({
    this.controller,
    this.onSubmitted,
    this.inputType = TextInputType.text,
    //this.inputDecoration,
    //this.boxDecoration,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: CupertinoTextField(
              controller: controller,
              onSubmitted: onSubmitted,
              placeholder: label,
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
            ),
          )
        : Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: TextField(
              decoration: InputDecoration(
                labelText: label,
                border: OutlineInputBorder(),
              ),
              keyboardType: inputType,
              onSubmitted: onSubmitted,
              controller: controller,
            ),
          );
  }
}
