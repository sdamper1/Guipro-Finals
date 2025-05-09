import 'package:flutter/material.dart';

void main() {
  runApp(ToDoApp());
}

class ToDoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Asian College To-Do',
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 192, 43, 43),
        scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
        appBarTheme: AppBarTheme(color: Color.fromARGB(255, 194, 42, 42)),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Color.fromARGB(255, 12, 124, 189),
        ),
      ),
      home: ToDoHomeScreen(),
    );
  }
}

class ToDoHomeScreen extends StatefulWidget {
  @override
  _ToDoHomeScreenState createState() => _ToDoHomeScreenState();
}

class _ToDoHomeScreenState extends State<ToDoHomeScreen> {
  List<String> tasks = [];

  void addTask(String task) {
    setState(() {
      tasks.add(task);
    });
  }

  void removeTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Asian College To-Do')),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder:
            (context, index) => ListTile(
              title: Text(tasks[index]),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () => removeTask(index),
              ),
            ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed:
            () => showDialog(
              context: context,
              builder: (context) {
                TextEditingController controller = TextEditingController();
                return AlertDialog(
                  title: Text('Add Task'),
                  content: TextField(controller: controller),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('Cancel'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        addTask(controller.text);
                        Navigator.pop(context);
                      },
                      child: Text('Add'),
                    ),
                  ],
                );
              },
            ),
      ),
    );
  }
}
