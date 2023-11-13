import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_todo_app/data/todo_repository_impl.dart';
import 'package:flutter_todo_app/domain/todo_model.dart';
import 'package:flutter_todo_app/presentation/component/inherited/todo_model_inherited_notifier.dart';
import 'package:flutter_todo_app/presentation/screen/todo_list_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  runApp(
    TodoApp(
      todoModel: TodoModel(
        todoRepository: TodoRepositoryImpl(
          sharedPreferences: sharedPreferences,
        ),
      ),
    ),
  );
}

class TodoApp extends StatelessWidget {
  final TodoModel todoModel;
  const TodoApp({
    super.key,
    required this.todoModel,
  });
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 763),
      child: TodoModelInheritedNotifier(
        notifier: todoModel,
        child: MaterialApp(
          title: 'Todo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Pretendard',
            useMaterial3: true,
          ),
          home: const TodoListScreen(),
        ),
      ),
    );
  }
}
