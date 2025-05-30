import 'package:a_c1_tasks/components/difficulty_widget.dart';
import 'package:a_c1_tasks/data/task_dao.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Task extends StatefulWidget {
  final String taskTitle;
  final String urlImage;
  final int taskDifficulty;

  Task(this.taskTitle, this.urlImage, this.taskDifficulty, {super.key});

  int level = 0;

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  bool assetOrNetwork() {
    if (widget.urlImage.contains('http')) {
      return false; // It's a network image
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            height: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.deepPurpleAccent,
            ),
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.white,
                ),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 72,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.black26,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: assetOrNetwork()
                            ? Image.asset(widget.urlImage, fit: BoxFit.cover)
                            : Image.network(widget.urlImage, fit: BoxFit.cover),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 200,
                          child: Text(
                            widget.taskTitle,
                            style: TextStyle(fontSize: 23),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        DifficultyWidget(
                          difficultyLevel: widget.taskDifficulty,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 52,
                      width: 80,
                      child: ElevatedButton(
                        onLongPress: () {
                          TaskDao().delete(widget.taskTitle);
                        },
                        onPressed: () {
                          setState(() {
                            widget.level++;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Icon(Icons.arrow_drop_up),
                            Text('Up', style: TextStyle(fontSize: 12)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 200,
                      child: LinearProgressIndicator(
                        color: Colors.white,
                        value: (widget.taskDifficulty > 0)
                            ? (widget.level / widget.taskDifficulty) / 10
                            : 1,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      'Nivel: ${widget.level}',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
