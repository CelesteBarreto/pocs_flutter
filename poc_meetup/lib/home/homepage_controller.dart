import 'package:flutter/material.dart';

class HomePageController {
  final text = ValueNotifier<String>('');
  TextEditingController myTextController = TextEditingController();

  updateText() {
    text.value = myTextController.text;
  }

  disposeController() {
    myTextController.dispose();
  }
}
