import 'package:flutter/material.dart';

import 'Text_widget.dart';


class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        child: const TextWidget(
            textValue: "Login", fontsize: 18, colors: Colors.grey));
  }
}
