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
    return   GetMaterialApp(
      theme: Themes.light,
      darkTheme:Themes.dark,
      themeMode:ThemeServices().theme,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: const HomePage() );
  }
}
