import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// state update 예제
final counterProvider = StateProvider<int>((ref) => 0);

class StateUpdateScreen extends ConsumerWidget {
  const StateUpdateScreen({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterProvider.notifier).update((state) => state + 1);
        },
      ),
    );
  }
}