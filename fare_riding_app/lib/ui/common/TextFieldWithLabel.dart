import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Textfieldwithlabel extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final String? initial;
  final String? svgIconPath;
  final String? Function(String?)? validator; // Thêm trường validator
  final bool? enable;

  const Textfieldwithlabel({
    Key? key,
    required this.controller,
    required this.hint,
    this.initial,
    this.svgIconPath,
    this.validator,
    this.enable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          hint,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 5),
        TextFormField(
          enabled: enable ?? true,
          controller: controller..text = initial ?? '',
          validator: validator, // Sử dụng validator
          decoration: InputDecoration(
            hintText: "Nhập " + hint.toLowerCase(),
            hintStyle: TextStyle(color: Colors.grey),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue), // Màu khi focus
              borderRadius: BorderRadius.circular(10.0),
            ),
            errorBorder: OutlineInputBorder( // Đường viền khi có lỗi
              borderSide: BorderSide(color: Colors.red), // Màu đỏ cho lỗi
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedErrorBorder: OutlineInputBorder( // Đường viền khi focus và có lỗi
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(10.0),
            ),
            suffixIcon: svgIconPath != null
                ? Padding(
              padding: const EdgeInsets.all(10.0),
              child: SvgPicture.asset(
                svgIconPath!,
              ),
            )
                : null,
          ),
          style: TextStyle(color: Colors.black),
        ),
      ],
    );
  }
}
