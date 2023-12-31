import 'package:flutter/material.dart';
import 'package:flutter_application_3/models/task.dart';
import 'package:flutter_application_3/ui/theme.dart';

class TaskTile extends StatelessWidget {
  const TaskTile(this.task,{Key? key,}) : super(key: key);
  final Task task;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 12),
        child: Container(
                padding: const EdgeInsets.all(8.0),

          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: getColor(task.color)),
          child: Row(
             children: [
            Expanded(
              child: SingleChildScrollView(
                
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Text(task.title!,
                      style: (const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white))),
                  const SizedBox(
                    height: 10,
                  ),
                  
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: 
                    [ 
                      Icon(
                        Icons.access_time_rounded,
                        color: Colors.grey[200],
                        size: 15,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                       Text(
                    '${task.startTime} - ${task.endTime}',
                    style: (TextStyle(fontSize: 13, color: Colors.grey[100])),
                  ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(task.note!,
                      style:
                          (TextStyle(fontSize: 15, color: Colors.grey[100]))
                          ),
                     
                ],
              )),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              height: 60,
              width: 0.5,
              color: Colors.grey[200]!.withOpacity(0.7),
            ),
            RotatedBox(
              quarterTurns: 3,
              child: Text(task.isCompleted == 0 ? '   TO DO    ' : 'Completed',
                  style: (const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white))),
            ),
          ]),
        ),
      ),
    );
  }
}

getColor(int? color) {
  switch (color) {
    case 0:
      return bluishClr;
      case 1:
      return orangeClr;
      case 2:
      return pinkClr;
      default:
      return bluishClr;
  }
}
