

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path_provider/path_provider.dart';
import 'package:task_master/app/environment/development_environment.dart';
import 'package:task_master/app/view/app.dart';
import 'package:task_master/feature/auth/login/login.dart';
import 'package:task_master/feature/splash/splash.dart';

import '../../helpers/helpers.dart';

class MockSplashCubit extends MockCubit<SplashState> implements SplashCubit {}

Future<void> main() async {
  group('SplashPage', () {
    // late SplashCubit splashCubit;
    //
    // setUp(() {
    //   splashCubit = MockSplashCubit();
    // });
    setUp(() async {
      const channel = MethodChannel('plugins.flutter.io/path_provider');
      TestDefaultBinaryMessengerBinding
          .instance
          .defaultBinaryMessenger
          .setMockMethodCallHandler(channel, (call) async {
          return '/home/user/directory'; // Return a valid path (e.g., current directory)

      });
      // TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      //     MethodCall methodCall) async {
      //   return '.'; // Return a valid path (e.g., current directory)
      // });
    });

    test('user save data', () async {
      final directory = await getApplicationDocumentsDirectory();
      print(directory);
      // Your test logic here
      // ...
    });
    testWidgets('renders SplashPage', (tester) async {
      await testBootstrap(
          pumper: () async {
            await tester.pumpApp(
              App(),
            );
          },
          environment: DevelopmentEnvironment(),
      );

      expect(find.byType(LoginView), findsOneWidget);
    },
    );
  });
}
