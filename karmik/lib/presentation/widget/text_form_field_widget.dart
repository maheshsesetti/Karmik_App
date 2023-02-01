import 'package:flutter/material.dart';

import '../../core/const/constant.dart';

class TextFormfieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hinttext;
  const TextFormfieldWidget(
      {super.key, required this.controller, required this.hinttext});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      enabled: true,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        errorBorder: InputBorder.none,
        border: textFieldBorder,
        enabledBorder: textFieldBorder,
        focusedBorder: textFieldBorder,
        // fillColor: textfieldcolor,
        filled: true,
        hintText: hinttext,
        hintStyle: TextStyle(color: hinttextcolor, fontSize: textfontsize
            // fontWeight: FontWeight.w400,
            ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return null;
        } else {
          return null;
        }
        // if (!isEmail(value!) && !isPhone(value)) {
        //   return MyWidgets.showSnackbar(context,
        //       'Please enter a valid email or phone number');
        // }
      },
    );
  }
}
