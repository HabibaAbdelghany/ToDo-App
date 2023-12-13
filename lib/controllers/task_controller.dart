import 'package:flutter_application_3/models/task.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TaskController extends GetxController {
  final taskList = <Task>[
Task(
  id:4,
  title: 'no,',
  note: 'note',
    startTime: DateFormat('HH:mm ').
    format(DateTime.now().add(const Duration(minutes: 1))).toString(),
  
    isCompleted: 1,
    color: 2,),
   

  ];
  getTasks() {
    // TODO: implement getTasks
  }
}
