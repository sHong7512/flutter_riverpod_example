import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// StateNotifierProvider 보다 심플한 데이터 상태를 관리 할 때는 사용된다.
enum DummyDataMode {
  first,
  second,
  third,
}

class DummyData {
  final firstData = ['1', '2', '3', '4', '5'];
  final secondData = ['a', 'b', 'c', 'd', 'e', 'f', 'g'];
  final thirdData = ['ㄱ', 'ㄴ', 'ㄷ', 'ㄹ', 'ㅁ', 'ㅂ'];
}

final dummyModeProvider = StateProvider<DummyDataMode>(
      (ref) => DummyDataMode.first,
);

final dummyProvider = Provider<List<String>>((ref) {
  final mode = ref.watch(dummyModeProvider);
  final dummyData = DummyData();
  switch (mode) {
    case DummyDataMode.first:
      return dummyData.firstData;
    case DummyDataMode.second:
      return dummyData.secondData;
    case DummyDataMode.third:
      return dummyData.thirdData;
  }
});

class StateProviderScreen extends ConsumerWidget {
  const StateProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dummyData = ref.watch(dummyProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              final dummyDataMode = ref.read(dummyModeProvider.notifier).state;
              switch (dummyDataMode) {
                case DummyDataMode.first:
                  ref.read(dummyModeProvider.notifier).state = DummyDataMode.second;
                  break;
                case DummyDataMode.second:
                  ref.read(dummyModeProvider.notifier).state = DummyDataMode.third;
                  break;
                case DummyDataMode.third:
                  ref.read(dummyModeProvider.notifier).state = DummyDataMode.first;
                  break;
              }
            },
            child: Text('Change Data Mode'),
          ),
          ListView.builder(
            itemCount: dummyData.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final dummy = dummyData[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  dummy,
                  textAlign: TextAlign.center,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
