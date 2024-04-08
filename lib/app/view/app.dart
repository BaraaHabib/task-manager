import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_master/app/constants/string_constants.dart';
import 'package:task_master/app/l10n/l10n.dart';
import 'package:task_master/app/router/app_router.dart';
import 'package:task_master/app/theme/dark/dark_theme.dart';
import 'package:task_master/app/theme/light/light_theme.dart';
import 'package:task_master/feature/app_state/cubit/app_state_cubit.dart';

class App extends StatelessWidget {
  App({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AppStateCubit(),
      child: ScreenUtilInit(
        minTextAdapt: true,
        useInheritedMediaQuery: true,
        builder: (_, child) => MaterialApp.router(
          // App Name
          title: StringConstants.appName,

          // Theme
          theme: LightTheme().theme,
          darkTheme: DarkTheme().theme,

          // Localization
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,

          // Routing
          routerConfig: _appRouter.config(),
        ),
      ),
    );
  }
}
