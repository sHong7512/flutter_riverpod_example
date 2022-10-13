import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// .autoDispose를 붙여주면 스크린을 떠나면 연결 해제 및 상태 초기화
final titleProvider = Provider((ref) => 'Test');

final descriptionProvider = FutureProvider.autoDispose<String>((ref) {
  return Future.delayed(const Duration(milliseconds: 2000), () => "future desc OK!");
});

final synthesisCountProvider = StreamProvider.autoDispose<String>((ref) {
  final title = ref.watch(titleProvider);
  AsyncValue<String> aa = ref.watch(descriptionProvider);

  return Stream.periodic(
    const Duration(milliseconds: 500),
    (int num) => '<$title$num> ${aa.when(
      data: (data) => data,
      error: (err, stack) => '$err',
      loading: () => 'loading',
    )}',
  );
});

class CombiningProviderScreen extends ConsumerWidget {
  const CombiningProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<String> streamAsyncValue = ref.watch(synthesisCountProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Combining Provider'),
      ),
      body: Center(
        child: streamAsyncValue.when(
          data: (data) => Text(data),
          loading: () => const CircularProgressIndicator(),
          error: (err, stack) => Text('Error: $err'),
        ),
      ),
    );
  }


}
