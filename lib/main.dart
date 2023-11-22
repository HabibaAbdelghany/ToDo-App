import 'package:flutter/material.dart';
import 'package:flutter_application_3/services/theme_services.dart';
import 'package:flutter_application_3/ui/pages/notification_screen.dart';
import 'package:flutter_application_3/ui/theme.dart';
import 'package:get/get.dart';

import 'ui/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // الأزرق
Color blue = Color(0xFF0000FF);

// الأبيض
Color white = Color.fromRGBO(255, 255, 255, 1);

// الرمادي
Color gray = Color.fromRGBO(128, 128, 128, 1);

// الفضي
Color silver = Color.fromRGBO(192, 192, 192, 1);

      return   GetMaterialApp(
      theme: Themes.light,
      darkTheme:Themes.dark,
      themeMode:ThemeServices().theme,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: const HomePage() ); 
  }
}
