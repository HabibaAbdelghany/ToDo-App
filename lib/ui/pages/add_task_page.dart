import 'package:flutter/material.dart';
import 'package:flutter_application_3/ui/theme.dart';
import 'package:flutter_application_3/ui/widgets/button.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:intl/intl.dart';
import '../theme.dart';

import '../../controllers/task_controller.dart';
import '../widgets/input_field.dart';

class AddTaskPage extends StatefulWidget {
  AddTaskPage({Key? key}) : super(key: key);

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TaskController _taskController = Get.put(TaskController());
  final TextEditingController titleController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  String startTime = DateFormat('hh:mm a').format(DateTime.now()).toString();
  DateTime selectedDate = DateTime.now();
  String endTime = DateFormat('hh:mm a')
      .format(DateTime.now().add(const Duration(minutes: 15)))
      .toString();
  int selectedRemind = 5;
  List<int> remindList = [5, 10, 15, 20];
  int selectColor = 0;

  String selectedRepeat = 'none';
  List<String> repeatList = ['None', 'Daily', 'Weekly', 'Monthly'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor: context.theme.backgroundColor,

      appBar:appBar() ,
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
              child: Column(
            children: [
              
              Text(
                ' Add Task',
                style: headingStyle,
              ),
              InputField(
                title: 'Title',
                hint: ' Enter Title Here',
                controller: titleController,
              ),
              InputField(
                title: 'Note',
                hint: ' Enter Note Here',
                controller: noteController,
              ),
              InputField(
                title: 'Date',
                hint: DateFormat.yMd().format(selectedDate),
                widget: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.calendar_today_outlined),
                  color: Colors.grey,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: InputField(
                      title: 'Start Time',
                      hint: startTime,
                      widget: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.access_time_rounded),
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Expanded(
                      child: InputField(
                    title: ' End Time',
                    hint: endTime,
                    widget: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.access_time_rounded),
                      color: Colors.grey,
                    ),
                  ))
                ],
              ),
              InputField(
                  title: 'Remind',
                  hint: '$selectedRemind Munites Early ',
                  widget: Row(
                    children: [
                      DropdownButton(
                        dropdownColor: Colors.teal,
                        borderRadius: BorderRadius.circular(20),
                        items: remindList
                            .map<DropdownMenuItem<String>>(
                                (int value) => DropdownMenuItem<String>(
                                    value: value.toString(),
                                    child: Text(
                                      '$value',
                                      style:
                                          const TextStyle(color: Colors.white),
                                    )))
                            .toList(),
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.grey,
                          size: 32,
                        ),
                        elevation: 4,
                        style: subHeadingStyle,
                        underline: Container(
                          height: 0,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedRemind = int.parse(newValue!);
                          });
                        },
                      ),
                      const SizedBox(width: 6),
                    ],
                  )),
              InputField(
                  title: 'Repeat',
                  hint: '$selectedRepeat Munites Early ',
                  widget: Row(
                    children: [
                      DropdownButton(
                        dropdownColor: Colors.teal,
                        borderRadius: BorderRadius.circular(20),
                        items: repeatList
                            .map<DropdownMenuItem<String>>(
                                (String value) => DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style:
                                          const TextStyle(color: Colors.white),
                                    )))
                            .toList(),
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.grey,
                          size: 32,
                        ),
                        elevation: 4,
                        style: subHeadingStyle,
                        underline: Container(
                          height: 0,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedRepeat = newValue!;
                          });
                        },
                      ),
                      const SizedBox(width: 20),
                    ],
                  )),
              const SizedBox(width: 30),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Column(
                  children: [
                    Text(
                      'Color',
                      style: headingStyle,
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Wrap(children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectColor = 0;
                          });
                        },
                        child: CircleAvatar(
                          child: selectColor == 0
                              ? Icon(Icons.done, size: 20, color: Colors.white)
                              : null,
                          backgroundColor: Colors.red,
                          radius: 15,
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectColor = 1;
                          });
                        },
                        child: CircleAvatar(
                          child: selectColor == 1
                              ? Icon(Icons.done, size: 20, color: Colors.white)
                              : null,
                          backgroundColor: Color.fromARGB(255, 225, 113, 21),
                          radius: 15,
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectColor = 2;
                          });
                        },
                        child: CircleAvatar(
                          child: selectColor == 2
                              ? Icon(Icons.done, size: 20, color: Colors.white)
                              : null,
                          backgroundColor: Color.fromARGB(255, 60, 178, 211),
                          radius: 15,
                        ),
                      ),
                    ])
                  ],
                ),
                const SizedBox(
                  width: 50,
                ),
                MyButton(
                  label: 'Create Task',
                  onTap: () {
                    Get.back();
                  },
                )
              ])
            ],
          ))),
    );
  }

  AppBar appBar() {
    return AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios, size: 24,color: Colors.teal,),
        ),   
      elevation: 0,
      backgroundColor: context.theme.backgroundColor,
      actions: const[
        CircleAvatar(
          backgroundImage: AssetImage('images/person.jpeg'),
          radius: 18,),
          SizedBox(width: 20,),
      ],

    
        );
  }
}
