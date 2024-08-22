import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';

import 'observer.dart';


extension PumpApp on WidgetTester {
  Future<void> pumpTestWidget(Widget widget) async {
    await pumpWidget(
      MaterialApp(
        navigatorObservers: [observer,],
        home: Builder(
          builder: (context) {
            ScreenUtil.init(context, minTextAdapt: true,
              designSize: const Size(375, 667),
            );
            return widget;
          },
        ),
      ),
    );
  }
}
