import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_master/app/router/app_router.gr.dart';
import 'package:task_master/core/assets/splash_assets.dart';

import 'package:task_master/feature/splash/splash.dart';

@RoutePage()
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SplashCubit()..init(),
      child: const SplashView(),
    );
  }
}

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SplashCubit, SplashState>(
      listenWhen: (ps, cs) => cs != ps,
      listener: (ctx, cs) {
        if (cs.status == SplashStateEnum.authenticated) {
          AutoRouter.of(context).replace(const TasksPage());
        } else if (cs.status == SplashStateEnum.unauthenticated) {
          AutoRouter.of(context).replace(const LoginPage());
        }
      },
      builder: (context, state) {
        return Container(
          height: 1.sh,
          padding: EdgeInsets.only(
            bottom: 0.1.sh,
          ),
          color: Colors.white,
          child: Image.asset(
            height: 1.sh,
            SplashAssets.splashLogo,
          ),
        );
      },
    );
  }
}
