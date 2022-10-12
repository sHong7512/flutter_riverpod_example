import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/screen/todo/todo.dart';
import 'package:riverpod_example/screen/todo/todos_notifier.dart';

/// StateNotifierProvider 예제
class TodoListScreen extends ConsumerWidget {
  const TodoListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Todo> todos = ref.watch(todosProvider);
    final todosRead = ref.read(todosProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text('TodoList'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            onPressed: () {
              todosRead.addTodo(Todo(
                  id: 'test${todos.length}',
                  description: 'description ${todos.length}',
                  completed: false),);
            },
            child: Text('add'),
          ),
          ElevatedButton(
            onPressed: () {
              todosRead.removeTodo('test${todos.length - 1}');
            },
            child: Text('remove'),
          ),
          Container(
            width: MediaQuery
                .of(context)
                .size
                .width,
            height: 400,
            color: Colors.brown,
            child: ListView(
              children: [
                for (final todo in todos)
                  CheckboxListTile(
                    value: todo.completed,
                    onChanged: (value) =>
                        ref.read(todosProvider.notifier).toggle(todo.id),
                    title: Text(
                      todo.description,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
