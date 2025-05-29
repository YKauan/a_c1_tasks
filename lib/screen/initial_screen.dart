import 'package:a_c1_tasks/data/task_inherited.dart';
import 'package:flutter/material.dart';

class InitialScreenWidget extends StatefulWidget {
  const InitialScreenWidget({super.key});

  @override
  State<InitialScreenWidget> createState() => _InitialScreenWidgetState();
}

class _InitialScreenWidgetState extends State<InitialScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tarefas'), leading: Container()),
      body: ListView(
        padding: EdgeInsets.only(top: 8, bottom: 70),
        children: TaskInherited.of(context)!.taskList,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushReplacementNamed("/form");
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
