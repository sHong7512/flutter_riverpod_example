import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final futureProvider = FutureProvider<int>((ref) {
  return Future.delayed(const Duration(milliseconds: 1000), () => 5);
});

class FutureProviderScreen extends ConsumerWidget {
  const FutureProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<int> futureAsyncValue = ref.watch(futureProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('FutureProvider'),
      ),
      body: Center(
        child: futureAsyncValue.when(
          data: (data) => Text('Value: $data'),
          loading: () => const CircularProgressIndicator(),
          error: (err, stack) => Text('Error: $err'),
        ),
      ),
    );
  }
}
