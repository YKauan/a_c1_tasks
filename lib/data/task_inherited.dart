import 'package:a_c1_tasks/components/task_widget.dart';
import 'package:flutter/material.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({Key? key, required Widget child})
    : super(key: key, child: child);

  final List<Task> taskList = [
    Task('Aprender Tlpp', 'assets/images/flutter_m.png', 3),
    Task('Aprender Tlpp', 'assets/images/flutter_m.png', 4),
    Task('Aprender Tlpp', 'assets/images/flutter_m.png', 1),
    Task('Aprender Tlpp', 'assets/images/flutter_m.png', 5),
  ];

  void newTask(String name, String image, int difficulty) {
    taskList.add(Task(name, image, difficulty));
  }

  static TaskInherited? of(BuildContext context) {
    final TaskInherited? result = context
        .dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}
