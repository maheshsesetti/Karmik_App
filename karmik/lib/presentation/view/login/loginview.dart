import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:karmik/presentation/pages/utils/image_assets.dart';

import '../../widget/Text_widget.dart';
import '../../widget/button_widget.dart';
import '../../widget/text_form_field_widget.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller_email = TextEditingController();
    final TextEditingController controller_password = TextEditingController();
    const String hinttext_email = " Enter your email/Username";
    const String hinttext_password = " Enter your Password";
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            SizedBox(
                height: 110.h, child: Image.asset(ImageAssetsPath.splashIcon2)),
            ListTile(
              leading: TextWidget(
                  textValue: "Login",
                  fontsize: 38.sp,
                  colors: Colors.black,
                  fWeight: FontWeight.bold),
              trailing: InkWell(
                onTap: () {},
                child: TextWidget(
                  textValue: "Register for free",
                  fontsize: 30.sp,
                  colors: Colors.blue,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 25.h,
              child: TextFormfieldWidget(
                  controller: controller_email, hinttext: hinttext_email),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 25.h,
              child: TextFormfieldWidget(
                  controller: controller_password, hinttext: hinttext_password),
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: InkWell(
                child: const TextWidget(
                  textValue: "Forgot Password?",
                  colors: Colors.blue,
                ),
                onTap: () {},
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const ButtonWidget(),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: InkWell(
                child: const TextWidget(
                  textValue: "Use OTP to Login",
                  colors: Colors.blue,
                ),
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
