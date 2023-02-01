import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String textValue;
  final double? fontsize;
  final Color? colors;
  final FontWeight? fWeight;
  const TextWidget({
    super.key,
    required this.textValue,
    this.fontsize,
    this.colors,
    this.fWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      textValue,
      style: TextStyle(fontSize: fontsize, color: colors, fontWeight: fWeight),
    );
  }
}
