import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/screen/home_Screen.dart';

// ref
// 1. 설명 잘 되어있음 (1,2,3)
// https://velog.io/@leeeeeoy/Flutter-Riverpod-%EC%82%AC%EC%9A%A9%ED%95%B4%EB%B3%B4%EA%B8%B0-1#%EC%BD%94%EB%93%9C-%EC%98%88%EC%8B%9C
// 2. https://velog.io/@udong85/Flutter-Riverpod-%EB%A1%9C-%EC%83%81%ED%83%9C-%EA%B4%80%EB%A6%AC-%ED%95%98%EA%B8%B0-1
void main() {
  runApp(
    /// 최상위에 ProviderScope를 지정하여 project 전반에 프로바이더 선언/접근을 가능하게 한다
    ProviderScope(
      child: MaterialApp(
        home: HomeScreen(),
      ),
    ),
  );
}
