import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:task_master/app/l10n/l10n.dart';
import 'package:task_master/app/router/app_router.gr.dart';
import 'package:task_master/core/extensions/context_extensions.dart';
import 'package:task_master/core/modules/task_master_ui/lib/src/task_master_ui.dart';
import 'package:task_master/core/modules/task_master_ui/lib/src/utils/toast.dart';
import 'package:task_master/feature/app_state/app_state.dart';
import 'package:task_master/feature/auth/login/helpers/field_names.dart';

import 'package:task_master/feature/auth/login/login.dart';

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
    return FormBuilder(
      key: context.read<LoginCubit>().formState,
      child: BlocConsumer<LoginCubit, LoginState>(
        listenWhen: _stateHasChanged,
        listener: _listener,
        buildWhen: _stateChanged,
        builder: (context, state) {
          return Scaffold(
            body: Center(
              child: Container(
                padding: const EdgeInsets.all(20),
                child: ListView(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  shrinkWrap: true,
                  children: [
                    const SizedBox(height: 20),

                    // Welcome Back Text
                    Text(
                      context.l10n.welcomeBack,
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 30),

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
                    const SizedBox(height: 15),

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
                    const SizedBox(height: 25),

                    // Login Button
                    PrimaryButton(
                      key: const ValueKey('login'),
                      onPressed: context.read<LoginCubit>().logIn,
                      loading: state.loading,
                      content: Text(
                        context.l10n.logIn,
                        style: context.textTheme.labelLarge,
                      ),
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  bool _stateHasChanged(LoginState previous, LoginState current) =>
      current != previous;

  void _listener(BuildContext context, LoginState state) {
    if (state.status == LogInStatusEnum.error) {
      showErrorSnackBar(context, state.errorMessage ?? '');
    } else if (state.status == LogInStatusEnum.success) {
      context.read<AppStateCubit>().logIn(state.token!);
      AutoRouter.of(context).replace(const TasksPage());
    }
  }

  bool _stateChanged(LoginState ps, LoginState cs) => cs != ps;
}
