import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 가장 간단한 기본 형태의 Provider이다. Provider는 읽기만 가능하며 값을 변경할 수 없다.
final valueProvider = Provider<int>((ref) {
  return 1;
});

// Stateless --> ComsumerWidget
class ValueProviderScreen extends ConsumerWidget {
  const ValueProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(valueProvider);
    return Scaffold(
      appBar: AppBar(title: Text('ValueProvier')),
      body: Center(
        child: Text(
          'Value: $value',
        ),
      ),
    );
  }
}

