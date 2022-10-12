import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// StateNotifierProvider는 상태 뿐만 아니라 일부 로직을 함께 저장할 때 사용된다. 예를 들어 다른 Provider와 결합을 하거나, 내부에서 사용할 로직을 정의할 수 있다.
class MyCounter extends StateNotifier<int> {
  MyCounter() : super(0);

  void increment() => state++;

  void decrement() => state--;

  void initCount() => state = 0;
}

final myCounterStateNotifierProvider = StateNotifierProvider<MyCounter, int>((ref) {
  return MyCounter();
});

class StateNotifierProviderScreen extends ConsumerWidget {
  const StateNotifierProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counterState = ref.watch(myCounterStateNotifierProvider);
    final counterRead = ref.read(myCounterStateNotifierProvider.notifier);

    ref.listen(
      myCounterStateNotifierProvider,
      (previous, next) {
        print('바뀔때마다 동작');
        print('ref.listen> 이전 :: $previous 바뀐 후 :: $next');
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('StateNotifierProvider'),
      ),
      body: body(counterState),
      floatingActionButton: bottom(counterRead),
    );
  }

  Widget body(int counterState) {
    return Center(
      child: Text(
        'Value: $counterState',
        style: const TextStyle(
          fontSize: 48,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget bottom(MyCounter counterRead) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: '111',
            onPressed: () => counterRead.increment(),
            child: const Icon(
              Icons.add,
            ),
          ),
          const SizedBox(width: 10.0),
          FloatingActionButton(
            heroTag: '222',
            onPressed: () => counterRead.decrement(),
            child: const Icon(
              Icons.remove,
            ),
          ),
          const SizedBox(width: 10.0),
          FloatingActionButton(
            heroTag: '333',
            onPressed: () => counterRead.initCount(),
            child: const Icon(
              Icons.refresh,
            ),
          ),
        ],
      ),
    );
  }
}
