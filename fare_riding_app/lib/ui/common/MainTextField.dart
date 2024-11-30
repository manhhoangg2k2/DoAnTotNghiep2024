import 'package:fare_riding_app/constant/AppColor.dart';
import 'package:flutter/material.dart';

class MainTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hint;
  final String? initial;
  final ValueChanged<String>? onChanged;
  final FocusNode? focusNode;
  final InputDecoration? inputDecoration;

  const MainTextField({
    Key? key,
    required this.controller,
    this.hint,
    this.initial,
    this.onChanged,
    this.focusNode,
    this.inputDecoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Chỉ thiết lập initial value nếu nó chưa được thiết lập trước đó
    if (initial != null && controller.text.isEmpty) {
      controller.text = initial!;
    }

    return TextField(
      onChanged: onChanged,
      focusNode: focusNode,
      controller: controller,
      decoration: inputDecoration ?? InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.main),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      style: TextStyle(color: Colors.black),
    );
  }
}
