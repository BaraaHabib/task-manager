import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:task_master/app/environment/app_environment.dart';
import 'package:task_master/app/view/app.dart';
import 'package:task_master/core/utils/device_info/device_info_utils.dart';
import 'package:task_master/core/utils/package_info/package_info_utils.dart';
import 'package:task_master/locator.dart';

Future<void> testBootstrap({required FutureOr<void> Function() pumper, required AppEnvironment environment}) async {

  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };
  await runZonedGuarded<Future<void>>(
        () async {
      TestWidgetsFlutterBinding.ensureInitialized();
      // HydratedBloc.storage = await HydratedStorage.build(
      //   storageDirectory: kIsWeb
      //       ? HydratedStorage.webStorageDirectory
      //       : await getTemporaryDirectory(),
      // );
      // Initialize Locator and Utils
      await Future.wait([
        Locator.locateServices(environment: environment),
        PackageInfoUtils.init(),
        DeviceInfoUtils.init(),
      ]);

      await pumper.call();
    },
        (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
    },
  );
}


extension PumpApp on WidgetTester {
  Future<void> pumpApp(Widget widget) async {
    return pumpWidget(
      App(),
    );
  }
}
