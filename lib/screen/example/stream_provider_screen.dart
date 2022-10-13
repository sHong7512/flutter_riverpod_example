import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final streamProvider = StreamProvider<int>((ref) {
  int count = 0;
  return Stream.periodic(const Duration(milliseconds: 1000), (_) => count++);
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
          data: (data) => animaBody(data),
          loading: () => const CircularProgressIndicator(),
          error: (err, stack) => Text('Error: $err'),
        ),
      ),
    );
  }

  Widget animaBody(int data) {
    double opacity = data == 0 ? 1 : 1 / data;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 120.0,
          width: 120.0,
          color: Colors.blue[50],
          child: AnimatedOpacity(
            opacity: opacity,
            duration: Duration(milliseconds: 1000),
            child: FlutterLogo(size: 70),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('data :: $data opacity :: '),
              Text('$opacity'),
            ],
          ),
        )
      ],
    );
  }
}
