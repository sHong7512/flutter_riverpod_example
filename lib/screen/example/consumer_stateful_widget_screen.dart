import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// WidgetRef는 ConsumerState에서 ref로 사용할 수 있음
final valueProvider2 = Provider((ref) => 77777);

final valueProvider3 = Provider((ref) => 88888);

class ConsumerStatefulWidgetScreen extends ConsumerStatefulWidget {
  const ConsumerStatefulWidgetScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ConsumerStatefulWidgetScreenState();
}

class _ConsumerStatefulWidgetScreenState
    extends ConsumerState<ConsumerStatefulWidget> {
  bool isOn = false;

  @override
  void initState() {
    super.initState();
    log('init State');
  }

  @override
  void dispose() {
    log('dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ConsumerStatefulWidget'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (isOn)
            Text(
              '${ref.watch(valueProvider3)}',
              textAlign: TextAlign.center,
            ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                isOn = !isOn;
              });
            },
            child: Text(isOn ? 'on' : 'off'),
          ),
          Text(
            '${ref.watch(valueProvider2)}',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
