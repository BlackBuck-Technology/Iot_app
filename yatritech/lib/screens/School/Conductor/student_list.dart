import 'package:flutter/material.dart';

class Student {
  final String id;
  final String name;

  Student({required this.id, required this.name});
}

class StudentList extends StatefulWidget {
  const StudentList({super.key});

  @override
  State<StudentList> createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
