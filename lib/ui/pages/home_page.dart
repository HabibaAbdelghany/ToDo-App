// ignore_for_file: prefer_const_constructors

import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/controllers/task_controller.dart';
import 'package:flutter_application_3/models/task.dart';
import 'package:flutter_application_3/services/notification_services.dart';
import 'package:flutter_application_3/services/theme_services.dart';
import 'package:flutter_application_3/ui/pages/add_task_page.dart';
import 'package:flutter_application_3/ui/pages/notification_screen.dart';
import 'package:flutter_application_3/ui/theme.dart';
import 'package:flutter_application_3/ui/widgets/input_field.dart';
import 'package:flutter_application_3/ui/widgets/button.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
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
  late NotifyHelper notifyHelper;
  void initState() {
    super.initState();
    notifyHelper = NotifyHelper();
    notifyHelper.requestIOSPermissions();
    notifyHelper.initializeNotification();
  }

  late final TaskController _taskController = Get.put(TaskController());
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: appBar(),
        body: Column(
          children: [
            addTaskBar(),
            addDateBar(),
            const SizedBox(
              height: 9,
            ),
            showTask(),
          ],
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

  addDateBar() {
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

  showTask() {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          var task = _taskController.taskList[index];
          var hour = task.startTime.toString().split(':')[0];
          var minute = task.startTime.toString().split(':')[1];
          debugPrint('my time ' + minute);
          debugPrint('my time ' + hour);
          var date = DateFormat('HH:mm').parse(task.startTime!);

          var myTime = DateFormat('HH:mm').format(date);

          notifyHelper.scheduledNotification(
              int.parse(myTime.toString().split(':')[0]),
              int.parse(myTime.toString().split(':')[1]),
              task);
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 1375),
            child: SlideAnimation(
              horizontalOffset: 300,
              child: FadeInAnimation(
                child: GestureDetector(
                  onTap: () {
                    showBottomSheet(
                      context,
                      task,
                    );
                  },
                  child: TaskTile(task),
                ),
              ),
            ),
          );
        },
        itemCount: _taskController.taskList.length,
      ),
    );
    /**/
  }

  showBottomSheet(BuildContext context, Task task) {
    Get.bottomSheet(SingleChildScrollView(
      child: Container(
          padding: EdgeInsets.only(top: 4),
          width: double.infinity,
          height: 230,
          color: Get.isDarkMode ? darkHeaderClr : Colors.white,
          child: Column(
            children: [
              Flexible(
                child: Container(
                  height: 20,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Get.isDarkMode ? Colors.grey[600] : Colors.grey[300],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              task.isCompleted == 1
                  ? Container()
                  : buildBottomSheet(
                      label: 'Task Completed',
                      onTab: () {
                        Get.back();
                      },
                      clr: primaryClr),
              SizedBox(
                height: 20,
              ),
              buildBottomSheet(
                  label: 'Delete Task ',
                  onTab: () {
                    Get.back();
                  },
                  clr: primaryClr),
              Divider(
                color: Get.isDarkMode ? Colors.grey[600] : Colors.grey[300],
              ),
              buildBottomSheet(
                  label: 'cancel',
                  onTab: () {
                    Get.back();
                  },
                  clr: primaryClr),
              SizedBox(
                height: 20,
              ),
            ],
          )),
    ));
  }

  buildBottomSheet(
      {required String label,
      required Function() onTab,
      required Color clr,
      bool isClose = false}) {
    return GestureDetector(
        onTap: () {},
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 1),
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: isClose
                  ? Get.isDarkMode
                      ? Colors.grey[600]!
                      : Colors.grey[300]!
                  : clr,
            ),
            borderRadius: BorderRadius.circular(20),
            color: isClose ? Colors.transparent : clr,
          ),
          child: Center(
            child: Text(
              label,
              style: isClose
                  ? titleStyle
                  : titleStyle.copyWith(
                      color:
//copywith function to edit some thing you already  built
                          Get.isDarkMode ? Colors.white : Colors.black,
                    ),
            ),
          ),
        ));
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
