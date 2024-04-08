import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:task_master/feature/auth/login/login.dart';


void main() {
  group('LogInCubit', () {
    test('log in success', () {
      expect(LoginCubit().state, equals(0));
    });

    blocTest<LoginCubit, LoginState>(
      'emits LogInStatusEnum.success when log in is tapped',
      build: LoginCubit.new,
      act: (cubit) => cubit.logIn(),
      expect: () => [true,],
    );

    // blocTest<CounterCubit, int>(
    //   'emits [-1] when decrement is called',
    //   build: CounterCubit.new,
    //   act: (cubit) => cubit.decrement(),
    //   expect: () => [equals(-1)],
    // );
  });
}
