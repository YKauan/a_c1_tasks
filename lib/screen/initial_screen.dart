import 'package:a_c1_tasks/components/task_widget.dart';
import 'package:flutter/material.dart';

class InitialScreenWidget extends StatefulWidget {
  const InitialScreenWidget({super.key});

  @override
  State<InitialScreenWidget> createState() => _InitialScreenWidgetState();
}

class _InitialScreenWidgetState extends State<InitialScreenWidget> {
  bool opacity = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tarefas'), leading: Container()),
      body: AnimatedOpacity(
        opacity: opacity ? 1 : 0,
        duration: Duration(milliseconds: 800),
        child: ListView(
          children: const [
            Task('Aprender Tlpp', 'assets/images/flutter_m.png', 3),
            Task('Aprender Tlpp', 'assets/images/flutter_m.png', 4),
            Task('Aprender Tlpp', 'assets/images/flutter_m.png', 1),
            Task('Aprender Tlpp', 'assets/images/flutter_m.png', 5),
            SizedBox(height: 80),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            opacity = !opacity;
          });
        },
        child: Icon(Icons.remove_red_eye),
      ),
    );
  }
}
