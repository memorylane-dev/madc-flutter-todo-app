import 'package:flutter/material.dart';
import 'package:flutter_todo_app/data/config_repository.dart';
import 'package:flutter_todo_app/data/todo_repository.dart';
import 'package:flutter_todo_app/domain/todo_model.dart';
import 'package:flutter_todo_app/todo_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final sharedPreferences = await SharedPreferences.getInstance();

  runApp(
    TodoApp(
      todoModel: TodoModel(
        todoRepository: TodoRepositoryImpl(
          sharedPreferences: sharedPreferences,
        ),
        configRepository: ConfigRepositoryImpl(
          sharedPreferences: sharedPreferences,
        ),
      ),
    ),
  );
}
