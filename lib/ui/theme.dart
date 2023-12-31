import 'package:flutter/material.dart';
import 'package:get/get.dart';

const Color bluishClr = Color.fromARGB(255, 43, 199, 181);
const Color orangeClr = Color.fromARGB(223, 223, 79, 7);
const Color pinkClr = Color(0xFFff4667);
const Color white = Colors.white;
const primaryClr = bluishClr;
const Color darkGreyClr = Color.fromARGB(255, 10, 9, 9);
const Color darkHeaderClr = Color(0xFF424242);
//const Color backgroundColor = Colors.white;

class Themes {
  static final light = ThemeData(
    primaryColor: primaryClr,
    backgroundColor: Colors.white,
    brightness: Brightness.light,
  );
  static final dark = ThemeData(
    primaryColor: darkGreyClr,
    backgroundColor: darkGreyClr,
    brightness: Brightness.dark,
  );
}

TextStyle get headingStyle {
  return TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Get.isDarkMode ? Colors.white : Colors.black,
  );
}

TextStyle get subHeadingStyle {
  return TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: Get.isDarkMode ? Colors.white : Color.fromARGB(255, 138, 132, 132),
  );
}

TextStyle get titleStyle {
  return TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: Get.isDarkMode ? Colors.white : Colors.black,
  );
}

TextStyle get subTitleStyle {
  return TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Get.isDarkMode ? Colors.white : Colors.black,
  );
}

TextStyle get body2Style {
  return TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Get.isDarkMode ? Colors.grey[200] : Colors.black,
  );
}
