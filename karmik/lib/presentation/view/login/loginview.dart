import 'package:flutter/material.dart';

import '../../widget/Text_widget.dart';
import '../../widget/button_widget.dart';
import '../../widget/text_form_field_widget.dart';


class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller_email = TextEditingController();
    final TextEditingController controller_password = TextEditingController();
    const String hinttext_email = " Enter email";
    const String hinttext_password = " Enter Password";
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const TextWidget(
                textValue: "Login", fontsize: 30, colors: Colors.teal),
            const SizedBox(
              height: 10,
            ),
            TextFormfieldWidget(
                controller: controller_email, hinttext: hinttext_email),
            const SizedBox(
              height: 10,
            ),
            TextFormfieldWidget(
                controller: controller_password, hinttext: hinttext_password),
            const SizedBox(height: 10,),
            const ButtonWidget()
          ],
        ),
      ),
    );
  }
}
