import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:intl/intl.dart';

import '../../controllers/task_controller.dart';

class AddTaskPage extends StatefulWidget {
  AddTaskPage({Key? key}) : super(key: key);
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

  String selectedRePEAT = 'none';
  List<String> repeatList = ['None', 'Daily', 'Weekly', 'Monthly'];

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(),
    );
  }
}
