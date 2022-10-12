import 'package:flutter/material.dart';
import 'package:riverpod_example/screen/example/future_provider_screen.dart';
import 'package:riverpod_example/screen/example/state_update_screen.dart';
import 'package:riverpod_example/screen/example/stream_provider_screen.dart';
import 'package:riverpod_example/screen/product/product_list_screen.dart';
import 'package:riverpod_example/screen/example/state_notifier_provider_screen.dart';
import 'package:riverpod_example/screen/todo/todo_list_screen.dart';
import 'package:riverpod_example/screen/example/value_provider_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) => ValueProviderScreen()));
            },
            child: Text('Value Provider'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) => StateNotifierProviderScreen()));
            },
            child: Text('State Notifier'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) => ProductListScreen()));
            },
            child: Text('Product List'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) => TodoListScreen()));
            },
            child: Text('Todo List'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) => StateUpdateScreen()));
            },
            child: Text('State Update'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) => FutureProviderScreen()));
            },
            child: Text('Future Provider'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) => StreamProviderScreen()));
            },
            child: Text('Stream Provider'),
          ),
        ],
      ),
    );
  }
}
