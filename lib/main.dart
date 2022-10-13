import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/screen/home_Screen.dart';

/* reference
  1. 설명 잘 되어있음 (1,2,3)
    https://velog.io/@udong85/Flutter-Riverpod-%EB%A1%9C-%EC%83%81%ED%83%9C-%EA%B4%80%EB%A6%AC-%ED%95%98%EA%B8%B0-1
  2.
    https://velog.io/@leeeeeoy/Flutter-Riverpod-%EC%82%AC%EC%9A%A9%ED%95%B4%EB%B3%B4%EA%B8%B0-1#%EC%BD%94%EB%93%9C-%EC%98%88%EC%8B%9C
 */
void main() {
  runApp(
    /// 최상위에 ProviderScope를 지정하여 project 전반에 프로바이더 선언/접근을 가능하게 한다
    ProviderScope(
      observers: [ProviderLogger()],
      child: MaterialApp(
        home: HomeScreen(),
      ),
    ),
  );
}

/// providerObserver 를 통해 ProviderContainer 의 변화를 관찰하여, provider 의 상태를 모니터링 할 수 있게 해줌.
class ProviderLogger extends ProviderObserver {
  /*
  didAddProvider : provider 가 초기화 될때 마다 호출
  didDisposeProvider : provider 가 Dispose 될때 마다 호출
  didUpdateProvider : provider 값이 변경 될때 마다 호출
   */
  @override
  void didAddProvider(
      ProviderBase provider, Object? value, ProviderContainer container) {
    super.didAddProvider(provider, value, container);
    log('<didAddProvider> $provider');
  }

  @override
  void didDisposeProvider(ProviderBase provider, ProviderContainer container) {
    super.didDisposeProvider(provider, container);
    log('<didDisposeProvider> $provider');
  }

  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    log('\n"provider": "${provider.name ?? provider.runtimeType}",\n'
        '"newValue": "$newValue"\n');
  }
}
