import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String textValue;
  final double fontsize;
  final MaterialColor colors;
  const TextWidget(
      {super.key,
      required this.textValue,
      required this.fontsize,
      required this.colors});

  @override
  Widget build(BuildContext context) {
    return Text(
      textValue,
      style: TextStyle(fontSize: fontsize, color: colors),
    );
  }
}
