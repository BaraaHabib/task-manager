

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:task_master/feature/splash/splash.dart';

import '../../helpers/shared_mockes.dart';


const Map<String, dynamic> logInModel = {
  'id': 1,
  'username': 'emilys',
  'email': 'emily.johnson@x.dummyjson.com',
  'firstName': 'Emily',
  'lastName': 'Johnson',
  'gender': 'female',
  'image': 'https://dummyjson.com/icon/emilys/128',
  'token': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwidXNlcm5hbWUiOiJtaWNoYWVsdyIsImVtYWlsIjoibWljaGFlbC53aWxsaWFtc0B4LmR1bW15anNvbi5jb20iLCJmaXJzdE5hbWUiOiJNaWNoYWVsIiwibGFzdE5hbWUiOiJXaWxsaWFtcyIsImdlbmRlciI6Im1hbGUiLCJpbWFnZSI6Imh0dHBzOi8vZHVtbXlqc29uLmNvbS9pY29uL21pY2hhZWx3LzEyOCIsImlhdCI6MTcxNzYxMTc0MCwiZXhwIjoxNzE3NjE1MzQwfQ.eQnhQSnS4o0sXZWARh2HsWrEr6XfDT4ngh0ejiykfH8',
  'refreshToken': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwidXNlcm5hbWUiOiJtaWNoYWVsdyIsImVtYWlsIjoibWljaGFlbC53aWxsaWFtc0B4LmR1bW15anNvbi5jb20iLCJmaXJzdE5hbWUiOiJNaWNoYWVsIiwibGFzdE5hbWUiOiJXaWxsaWFtcyIsImdlbmRlciI6Im1hbGUiLCJpbWFnZSI6Imh0dHBzOi8vZHVtbXlqc29uLmNvbS9pY29uL21pY2hhZWx3LzEyOCIsImlhdCI6MTcxNzYxMTc0MCwiZXhwIjoxNzIwMjAzNzQwfQ.YsStJdmdUjKOUlbXdqze0nEScCM_RJw9rnuy0RdSn88',
};

Future<void> main() async {

  final mockTaskMasterStorage = MockTaskMasterStorage();
  // final mockHiveStorage = MockHiveStorage();

  late SplashCubit splashCubit;

  setUp(() async {
    splashCubit = SplashCubit(storage: mockTaskMasterStorage,);
  });


  group('Test Splash authenticated, not authenticated', () {
    blocTest<SplashCubit, SplashState>(
      'emits SplashState.unauthenticated when user is not authenticated',
      build: () => splashCubit,
      setUp: () {
        when(() => mockTaskMasterStorage.getUserData,)
            .thenAnswer((_) => null,);

      },
      act: (cubit) async => cubit.init(),
      expect: () =>
      [
        const SplashState.loading(),
        const SplashState.unauthenticated(),
      ],
    );

    blocTest<SplashCubit, SplashState>(
      'emits SplashState.authenticated when user is authenticated',
      build: () => splashCubit,
      setUp: () {
        when(() => mockTaskMasterStorage.getUserData,)
            .thenAnswer((_) => logInModel,);

      },
      act: (cubit) async => cubit.init(),
      expect: () =>
      [
        const SplashState.loading(),
        const SplashState.authenticated(),
      ],
    );
  });
}
