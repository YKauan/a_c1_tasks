import 'package:a_c1_tasks/components/task_widget.dart';
import 'package:a_c1_tasks/data/task_dao.dart';
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
      appBar: AppBar(
        title: Text('Tarefas'),
        leading: Container(),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {});
            },
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 8, bottom: 70),
        child: FutureBuilder<List<Task>>(
          future: TaskDao().findAll(),
          builder: (context, snapshot) {
            List<Task>? items = snapshot.data;
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Center(
                  child: Column(
                    children: [
                      CircularProgressIndicator(),
                      Text(
                        "Carregando tarefas...",
                        style: TextStyle(fontSize: 32),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              case ConnectionState.waiting:
                return Center(
                  child: Column(
                    children: [
                      CircularProgressIndicator(),
                      Text(
                        "Carregando tarefas...",
                        style: TextStyle(fontSize: 32),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              case ConnectionState.active:
                return Center(
                  child: Column(
                    children: [
                      CircularProgressIndicator(),
                      Text(
                        "Carregando tarefas...",
                        style: TextStyle(fontSize: 32),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              case ConnectionState.done:
                if (snapshot.hasData && items != null) {
                  if (items.isNotEmpty) {
                    return ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (BuildContext context, int index) {
                        final Task task = items[index];
                        return task;
                      },
                    );
                  }
                  return Center(
                    child: Column(
                      children: [
                        Icon(Icons.error_outline, size: 128),
                        Text(
                          "Não há tarefas cadastradas",
                          style: TextStyle(fontSize: 32),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                }
                return Text(
                  "Erro ao carregar tarefas ${snapshot.error}",
                  style: TextStyle(fontSize: 32),
                  textAlign: TextAlign.center,
                );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(
            context,
          ).pushReplacementNamed("/form").then((value) => setState(() {}));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
