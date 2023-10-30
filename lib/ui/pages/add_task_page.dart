import 'package:flutter/material.dart';
import 'package:flutter_application_3/ui/theme.dart';
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
      appBar: AppBar(),
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
                      title: 'End Time',
                      hint: endTime,
                      widget: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.access_time_rounded),
                        color: Colors.grey,
                      ),
                    )
                  )
                ],
              ),
InputField(
                  title: 'Remind',
                  hint: '$selectedRemind Munites Early ',
                  widget: DropdownButton(
                    dropdownColor: Colors.blue,
                                        borderRadius: BorderRadius.circular(20),

                    items: remindList
                        .map<DropdownMenuItem<String>>(
                          (int value) => DropdownMenuItem<String>(
                          value: value.toString(),
                                child: Text(
                              '$value',
                              style: const TextStyle(color: Colors.white),
                            )))
                        .toList(),
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.grey,
                      size: 32,
                    ),
                    elevation: 4,
                    style: subHeadingStyle,
                    underline: Container(height: 0,),
                    onChanged: ( String ?newValue) {
                      setState(() {
                        selectedRemind = int.parse(newValue!);
                      });
                    },
                  )),                

              InputField(
                  title: 'Repeat',
                  hint: '$selectedRepeat Munites Early ',
                  widget: DropdownButton(
                    dropdownColor: Colors.blue,
                    borderRadius: BorderRadius.circular(20),
                    items: repeatList
                        .map<DropdownMenuItem<String>>(
                          (  String value) => DropdownMenuItem<String>(
                          value: value,
                                child: Text(
                              value,
                              style: const TextStyle(color: Colors.white),
                            )))
                        .toList(),
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.grey,
                      size: 32,
                    ),
                    elevation: 4,
                    style: subHeadingStyle,
                    underline: Container(height: 0,),
                    onChanged: ( String ?newValue) {
                      setState(() {
                        selectedRepeat = newValue!;
                      });
                    },
                  )),
            ],
          ))),
    );
  }
}
