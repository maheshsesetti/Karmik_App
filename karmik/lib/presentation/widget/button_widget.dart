import 'package:flutter/material.dart';
import 'package:karmik/routes/route_page.dart';
import 'package:routemaster/routemaster.dart';

import 'Text_widget.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Routemaster.of(context).push(InitialPageRoutes.homepage);
        },
        child: const TextWidget(
            textValue: "Login", fontsize: 16, colors: Colors.white));
  }
}
