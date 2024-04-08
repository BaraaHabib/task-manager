import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:task_master/feature/auth/login/login.dart';
import 'package:task_master/feature/splash/splash.dart';

import '../../helpers/helpers.dart';

class MockLoginCubit extends MockCubit<LoginState> implements LoginCubit {}

void main() {
  group('SplashPage', () {
    testWidgets('renders SplashPage', (tester) async {
      await tester.pumpApp(const SplashPage());
      expect(find.byType(SplashPage), findsOneWidget);
    });
  });

  group('LoginPage', () {
    testWidgets('renders LoginPage', (tester) async {
      await tester.pumpApp(const LoginPage());
      expect(find.byType(LoginView), findsOneWidget);
    });
  });

  group('LoginView', () {
    late LoginCubit loginCubit;

    setUp(() {
      loginCubit = MockLoginCubit();
    });

    testWidgets('calls login when login button is tapped',
        (tester) async {
      // when(() => loginCubit.logIn()).thenReturn(LoginState(status: LogInStatusEnum.success,));

      await tester.pumpApp(
        BlocProvider.value(
          value: loginCubit,
          child: const LoginView(),
        ),
      );
      await tester.tap(find.byKey(const ValueKey('login')));
      verify(() => loginCubit.logIn()).called(1);
    });

  });
}
