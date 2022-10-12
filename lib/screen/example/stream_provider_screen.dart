import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final streamProvider = StreamProvider<int>((ref) {
  int count = 0;
  return Stream.periodic(const Duration(seconds: 2), (_) => count++);
});

class StreamProviderScreen extends ConsumerWidget {
  const StreamProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<int> streamAsyncValue = ref.watch(streamProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Stream Provider'),
      ),
      body: Center(
        child: streamAsyncValue.when(
          data: (data) => Text('Value: $data'),
          loading: () => const CircularProgressIndicator(),
          error: (err, stack) => Text('Error: $err'),
        ),
      ),
    );
  }
}
