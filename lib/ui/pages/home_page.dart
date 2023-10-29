import 'package:flutter/material.dart';
import 'package:flutter_application_3/services/theme_services.dart';
import 'package:flutter_application_3/ui/pages/add_task_page.dart';
import 'package:flutter_application_3/ui/pages/notification_screen.dart';
import 'package:flutter_application_3/ui/widgets/input_field.dart';
import 'package:get/get.dart';

import '../widgets/button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Column(
          children: [
            IconButton(
              onPressed: () {
                // ThemeServices().switchTheme();
                Get.to(const NotificationScreen(
                  payload: 'title| descrition|date',
                ));
              },
              icon: const Icon(Icons.menu),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MyButton(
              label: 'Add Task',
              onTap: () {
                Get.to( AddTaskPage());
              },
            ),
            const InputField(
              title: 'Title',
              hint: 'Enter Something',
              widget: Icon(Icons.alarm),
            )
          ],
        ),
      ),
    );
  }
}
