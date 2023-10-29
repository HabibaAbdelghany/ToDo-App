import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeServices {
  final GetStorage box = GetStorage();
  final key = 'isDarMode';
  bool loadThemeFromBox() {
    return box.read<bool>(key) ?? false;
  }

  saveThemeFromBox(bool isDarkMode) {
    box.write(key, isDarkMode);
  }

  ThemeMode get theme => loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light;

  void switchTheme() {
    Get.changeThemeMode(loadThemeFromBox() ? ThemeMode.light : ThemeMode.dark);
    saveThemeFromBox(!loadThemeFromBox());
    //القيمه الجديده عكس القيمه الجديده
  }
}
