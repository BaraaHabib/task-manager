import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:task_master/app/l10n/l10n.dart';
import 'package:task_master/app/router/app_router.gr.dart';
import 'package:task_master/core/extensions/context_extensions.dart';
import 'package:task_master/feature/app_state/app_state.dart';
import 'package:task_master/feature/auth/login/helpers/field_names.dart';
import 'package:task_master/feature/auth/login/login.dart';
import 'package:task_master_ui/task_master_ui.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(),
      child: const LoginView(),
    );
  }
}

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listenWhen: _stateHasChanged,
      listener: _listener,
      buildWhen: _stateChanged,
      builder: (context, state)  {
        return FormBuilder(
          key: context.read<LoginCubit>().formState,
          enabled: !state.loading,
          initialValue: {
            LogInFieldNames.userName.name: 'emilys',
            LogInFieldNames.password.name: 'emilyspass',
          },
          child: Scaffold(
            body: Center(
              child: Container(
                padding: EdgeInsets.all(20.r),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),

                    // Welcome Back Text
                    Text(
                      context.l10n.welcomeBack,
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    30.verticalSpace,

                    // Username TextField
                    Row(
                      children: [
                        Expanded(
                          child: FormBuilderTextField(
                            name: LogInFieldNames.userName.name,
                            validator: FormBuilderValidators.required(),
                            decoration: InputDecoration(
                              hintText: context.l10n.username,
                            ),
                          ),
                        ),
                      ],
                    ),
                    15.verticalSpace,

                    // Password TextField
                    Row(
                      children: [
                        Expanded(
                          child: FormBuilderTextField(
                            name: LogInFieldNames.password.name,
                            validator: FormBuilderValidators.required(),
                            obscureText: true, // Hide password text
                            decoration: InputDecoration(
                              hintText: context.l10n.password,
                            ),
                          ),
                        ),
                      ],
                    ),
                    25.verticalSpace,

                    // Login Button
                    Row(
                      children: [
                        Expanded(
                          child: PrimaryButton(
                            key: const ValueKey('login'),
                            onPressed: context.read<LoginCubit>().logIn,
                            loading: state.loading,
                            content: Text(
                              context.l10n.logIn,
                              style: context.textTheme.labelLarge,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const Spacer(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  bool _stateHasChanged(LoginState previous, LoginState current) =>
      current != previous;

  void _listener(BuildContext context, LoginState state) {
    if (state.status == LogInStatusEnum.error) {
      showErrorSnackBar(context, state.errorMessage ?? '');
    } else if (state.status == LogInStatusEnum.success) {
      context.read<AppStateCubit>().logIn(
            state.data!,
          );
      AutoRouter.of(context).replace(const TasksPage());
    }
  }

  bool _stateChanged(LoginState ps, LoginState cs) => cs != ps;
}
