// ignore_for_file: prefer_const_constructors

import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/controllers/task_controller.dart';
import 'package:flutter_application_3/models/task.dart';
import 'package:flutter_application_3/services/theme_services.dart';
import 'package:flutter_application_3/ui/pages/add_task_page.dart';
import 'package:flutter_application_3/ui/pages/notification_screen.dart';
import 'package:flutter_application_3/ui/theme.dart';
import 'package:flutter_application_3/ui/widgets/input_field.dart';
import 'package:flutter_application_3/ui/widgets/button.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../widgets/button.dart';
import '../widgets/task_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final TaskController _taskController = Get.put(TaskController());
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: appBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              addTaskBar(),
              addDataBar(),
              const SizedBox(
                height: 7,
              ),
              showData(),
            ],
          ),
        ));
  }

  AppBar appBar() {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          ThemeServices().switchTheme();
        },
        icon: Icon(
            Get.isDarkMode
                ? Icons.wb_sunny_outlined
                : Icons.nightlight_round_outlined,
            size: 24,
            color: Get.isDarkMode ? Colors.white : darkGreyClr),
      ),
      elevation: 0,
      backgroundColor: context.theme.backgroundColor,
      actions: const [
        CircleAvatar(
          backgroundImage: AssetImage('images/person.jpeg'),
          radius: 18,
        ),
        SizedBox(
          width: 20,
        ),
      ],
    );
  }

  addTaskBar() {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat.yMMMMd().format(DateTime.now()),
                style: subTitleStyle,
              ),
              Text(
                'Today',
                style: headingStyle,
              ),
            ],
          ),
          MyButton(
            label: '+ Add Tasks',
            onTap: () async {
              await Get.to(AddTaskPage());
              _taskController.getTasks;
            },
          ),
        ],
      ),
    );
  }

  addDataBar() {
    return Container(
      margin: const EdgeInsets.only(
        top: 6,
      ),
      child: DatePicker(
        DateTime.now(),
        height: 100,
        width: 60,
        initialSelectedDate: DateTime.now(),
        selectedTextColor: white,
        selectionColor: primaryClr,
        dateTextStyle: TextStyle(
          color:
              Get.isDarkMode ? Colors.white : Color.fromARGB(255, 15, 15, 15),
        ),
        monthTextStyle: TextStyle(
          color:
              Get.isDarkMode ? Colors.white : Color.fromARGB(255, 15, 15, 15),
        ),
        dayTextStyle: TextStyle(
          color:
              Get.isDarkMode ? Colors.white : Color.fromARGB(255, 15, 15, 15),
        ),
        onDateChange: (newDate) {
          setState(() {
            selectedDate = newDate;
          });
        },
      ),
    );
  }

  showData() {
    return Expanded(child: TaskTile( 
      Task(
title:' d',
note:'text note',
isCompleted: 1,
   date:' date',
   startTime: '222',
   endTime: '999',
   color:1,
    )),

    );
  }
}
/** return Stack(
      children: [
        SingleChildScrollView(
          child: Wrap(
            direction: Axis.horizontal,
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              SizedBox(height: 180,),
              SvgPicture.asset('images/task.svg',
              height: 90,
              color:primaryClr.withOpacity(0.6),
              semanticsLabel: 'Task',),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Text(
                  'You don`t have any tasks yet !\n Add new tasks to make your days productive .',
                  style: subTitleStyle,
                  textAlign: TextAlign.center,
                ),
              ),
          //    SizedBox(height: 100,)
            ],
          ),
        )
      ],
    ); */