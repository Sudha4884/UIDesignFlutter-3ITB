import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

void main() {
  runApp(TodoApp());
}

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TodoListPage(),
    );
  }
}

class TodoListPage extends StatefulWidget {
  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final List<Map<String, dynamic>> _todos = [];
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadTodos();
  }

  Future<void> _loadTodos() async {
    final prefs = await SharedPreferences.getInstance();
    final String? todosJson = prefs.getString('todos');
    if (todosJson != null) {
      setState(() {
        _todos.addAll(List<Map<String, dynamic>>.from(json.decode(todosJson)));
      });
    }
  }

  Future<void> _saveTodos() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('todos', json.encode(_todos));
  }

  void _addTodo() {
    final text = _controller.text;
    if (text.isNotEmpty) {
      setState(() {
        _todos.add({'task': text, 'completed': false});
        _controller.clear();
        _saveTodos();
      });
    }
  }

  void _deleteTodoAt(int index) {
    setState(() {
      _todos.removeAt(index);
      _saveTodos();
    });
  }

  void _toggleComplete(int index) {
    setState(() {
      _todos[index]['completed'] = !_todos[index]['completed'];
      _saveTodos();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      labelText: 'Enter a task',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _addTodo,
                  child: Text('Add'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _todos.length,
              itemBuilder: (context, index) {
                final todo = _todos[index];
                return ListTile(
                  title: Text(
                    todo['task'],
                    style: TextStyle(
                      decoration: todo['completed']
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  leading: Checkbox(
                    value: todo['completed'],
                    onChanged: (_) => _toggleComplete(index),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => _deleteTodoAt(index),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
