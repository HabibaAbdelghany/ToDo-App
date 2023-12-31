

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
 // الأزرق
Color blue = Color(0xFF0000FF);

// الأبيض
Color white = Color.fromRGBO(255, 255, 255, 1);

// الرمادي
Color gray = Color.fromRGBO(128, 128, 128, 1);

// الفضي
Color silver = Color.fromRGBO(192, 192, 192, 1);
 @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: blue,
        accentColor: silver,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Demo'),
        ),
        body: Center(
          
          child: Container(
            width: 200,
            height: 200,
            color: white,
            child: Text('Hello, Flutter!', style: TextStyle(color: gray)),
          ),
        ),
      ),
    );
  }
}
