import 'package:flutter/material.dart';

class TextBase extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final double? letterSpacing;
  final double? wordSpacing;
  final TextDecoration? decoration;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final bool? softWrap;
  final TextOverflow? overflow;
  final int? maxLines;

  const TextBase({
    Key? key,
    required this.text,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
    this.letterSpacing,
    this.wordSpacing,
    this.decoration,
    this.textAlign,
    this.textDirection,
    this.softWrap,
    this.overflow,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color ?? Colors.black,
        fontSize: fontSize ?? 14.0,
        fontWeight: fontWeight ?? FontWeight.normal,
        fontStyle: fontStyle ?? FontStyle.normal,
        letterSpacing: letterSpacing ?? 0.0,
        wordSpacing: wordSpacing ?? 0.0,
        decoration: decoration ?? TextDecoration.none,
      ),
      textAlign: textAlign ?? TextAlign.start,
      textDirection: textDirection ?? TextDirection.ltr,
      softWrap: softWrap ?? true,
      overflow: overflow ?? TextOverflow.clip,
      maxLines: maxLines ?? 1,
    );
  }
}
