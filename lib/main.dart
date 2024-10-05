import 'package:flutter/material.dart';
import 'package:flutter_application_1/modal/Items.dart';
import 'package:flutter_application_1/widget/cardBody.dart';
import 'package:flutter_application_1/widget/cardModalBottom.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final List<DataItems> items = [];

  // Định nghĩa hàm _handleAddTask bên trong class _MainAppState
  void _handleAddTask(String name) {
    final newItem = DataItems(DateTime.now().toString(), name);
    setState(() {
      // Được gọi đúng trong StatefulWidget
      items.add(newItem);
    });
  }

  void _handleDeleteTask(String id) {
    setState(() {
      items.removeWhere((item) => item.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 80.0,
          title: const Text(
            'ToDoList',
            style: TextStyle(
              color: Colors.white,
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: const Color(0xFFf3aab5),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
              children: items
                  .map((item) => cardBody(
                        index: items.indexOf(item),
                        item: item,
                        handleDelete: _handleDeleteTask,
                      ))
                  .toList()),
        ),
        // Truyền hàm _handleAddTask vào FloatingActionButtonCustom
        floatingActionButton: FloatingActionButtonCustom(
          addTask: _handleAddTask,
        ),
      ),
    );
  }
}

// Lớp riêng cho FloatingActionButton
class FloatingActionButtonCustom extends StatelessWidget {
  final Function(String) addTask;

  const FloatingActionButtonCustom({super.key, required this.addTask});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          backgroundColor: const Color.fromARGB(255, 252, 226, 241),
          isScrollControlled: true,
          context: context,
          builder: (BuildContext context) {
            return cardModalBottom(addTask: addTask);
          },
        );
      },
      child: const Icon(Icons.add),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 198, 207),
    );
  }
}
