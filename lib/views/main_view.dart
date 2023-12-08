import 'package:calculator/controllers/main_controller.dart';
import 'package:calculator/views/button_hub.dart';
import 'package:calculator/views/display.dart';
import 'package:flutter/material.dart';

import '../dependencies/set_up_get_it.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = getIt<MainController>();

    return Material(
      child: Column(
        children: [
          Expanded(
            child: StreamBuilder<String>(
                stream: controller.displayValue,
                builder: (context, snapshot) {
                  String value = '0';

                  if (!snapshot.hasData) {
                    value = '0';
                  } else if (snapshot.data == '') {
                    value = '0';
                  } else {
                    value = snapshot.data!;
                  }

                  return Display(value: value);
                }),
          ),
          Expanded(
            flex: 4,
            child: ButtonHub(
              onButtonClick: (event) => controller.buttonClickEvent(event),
            ),
          )
        ],
      ),
    );
  }
}
