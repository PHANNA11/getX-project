import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ThemeColor extends GetxController {
  late bool dark;
  switchTheme(bool darkTheme) {
    dark = darkTheme;
  }
}
