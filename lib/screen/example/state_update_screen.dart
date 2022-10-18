import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// state update 예제
final counterProvider = StateProvider<int>((ref) => 0);

class StateUpdateScreen extends ConsumerWidget {
  const StateUpdateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StateUpdate'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterProvider.notifier).update((state) => state + 1);
        },
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Text(
          '${ref.watch(counterProvider)}',
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}
