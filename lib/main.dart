import 'package:flutter/material.dart';
import 'package:todolist_app/screens/sign_in_screen.dart';

void main() {
  runApp(const ToDoList());
}

class ToDoList extends StatefulWidget {
  const ToDoList({super.key});

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      // theme: ThemeData.light(),
      title: 'To Do List',
      debugShowCheckedModeBanner: false,
      home: SignInScreen(),
    );
  }
}