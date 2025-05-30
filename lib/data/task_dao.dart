import 'package:a_c1_tasks/components/task_widget.dart';
import 'package:a_c1_tasks/data/database.dart';
import 'package:sqflite/sqflite.dart';

class TaskDao {
  static const String tableSql =
      'CREATE TABLE $_tableName('
      '$_name TEXT, '
      '$_urlImage TEXT, '
      '$_difficulty INTEGER, '
      '$_imageUrl TEXT)';

  static const String _tableName = 'taskTable';
  static const String _name = 'name';
  static const String _urlImage = 'urlImage';
  static const String _difficulty = 'difficulty';
  static const String _imageUrl = 'imageUrl';

  save(Task task) async {
    final Database dataBase = await getDatabase();
    var itemExists = await find(task.taskTitle);

    Map<String, dynamic> taskMap = toMap(task);
    if (itemExists.isEmpty) {
      return await dataBase.insert(_tableName, taskMap);
    } else {
      return await dataBase.update(
        _tableName,
        taskMap,
        where: '$_name = ?',
        whereArgs: [task.taskTitle],
      );
    }
  }

  delete(String taskName) async {
    final Database dataBase = await getDatabase();
    return await dataBase.delete(
      _tableName,
      where: '$_name = ?',
      whereArgs: [taskName],
    );
  }

  Future<List<Task>> find(String taskName) async {
    final Database dataBase = await getDatabase();
    final List<Map<String, dynamic>> result = await dataBase.query(
      _tableName,
      where: '$_name = ?',
      whereArgs: [taskName],
    );
    return toList(result);
  }

  Future<List<Task>> findAll() async {
    final Database dataBase = await getDatabase();
    final List<Map<String, dynamic>> result = await dataBase.query(_tableName);
    return toList(result);
  }

  Map<String, dynamic> toMap(Task task) {
    return {
      _name: task.taskTitle,
      _urlImage: task.urlImage,
      _difficulty: task.taskDifficulty,
      _imageUrl: task.urlImage,
    };
  }

  List<Task> toList(List<Map<String, dynamic>> taskMap) {
    final List<Task> tasks = [];
    for (Map<String, dynamic> row in taskMap) {
      final Task task = Task(row[_name], row[_urlImage], row[_difficulty]);
      tasks.add(task);
    }
    return tasks;
  }
}
