import 'package:a_c1_tasks/data/task_inherited.dart';
import 'package:a_c1_tasks/screen/form_screen.dart';
import 'package:a_c1_tasks/screen/initial_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(TaskInherited(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: "/home",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routes: {
        "/home": (context) => const InitialScreenWidget(),
        "/form": (context) => FormScreen(taskContext: context),
      },
    );
  }
}
