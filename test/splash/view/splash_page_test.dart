

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:path_provider/path_provider.dart';
import 'package:task_master/app/environment/development_environment.dart';
import 'package:task_master/app/view/app.dart';
import 'package:task_master/feature/auth/login/login.dart';
import 'package:task_master/feature/splash/splash.dart';

import '../../helpers/helpers.dart';
import '../../helpers/observer.dart';
import '../../helpers/shared_mockes.dart';

class MockSplashCubit extends MockCubit<SplashState> implements SplashCubit {}

Future<void> main() async {
  group('SplashPage', () {
    final splashCubit = MockSplashCubit();
    final storage = MockTaskMasterStorage();

    setUp(() {

    });

    when(() => storage.getUserData).thenReturn({});

    testWidgets('User already logged in', (tester) async {
      when(() => splashCubit.state)
          .thenReturn(const SplashState.authenticated());

      await tester.pumpTestWidget(BlocProvider<SplashCubit>.value(
        value: splashCubit,
        child: const SplashView(),
      ),
      );

      final finder = find.byType(SplashView);

      expect(finder, findsOneWidget);
    },
    );

    testWidgets(
      'User is not logged in and redirected to login view', (tester) async {
      when(() => splashCubit.state)
          .thenReturn(const SplashState.unauthenticated());

      await tester.pumpTestWidget(
        BlocProvider<SplashCubit>.value(
          value: splashCubit,
          child: const SplashView(),
        ),
      );

      // final finder = find.byType(LoginView);
      observer.onPushed = (Route<dynamic>? route, Route<dynamic>? previousRoute) {
        expect(route is PageRoute && route.settings.name == 'SplashPage', isTrue);
      };
    },
    );
  });
}
