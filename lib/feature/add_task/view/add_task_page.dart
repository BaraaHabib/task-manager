
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:task_master/app/l10n/l10n.dart';
import 'package:task_master/core/extensions/context_extensions.dart';
import 'package:task_master/feature/add_task/add_task.dart';
import 'package:task_master/feature/add_task/helpers/form_helpers.dart';
import 'package:task_master_repo/task_manager_repo.dart';
import 'package:task_master_ui/task_master_ui.dart';

@RoutePage()
class AddTaskPage extends StatelessWidget {
  const AddTaskPage({this.task, super.key,});

  final TaskModel? task;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AddTaskBloc(task: task,),
      child: const AddTaskView(),
    );
  }
}

class AddTaskView extends StatelessWidget {
  const AddTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddTaskBloc, AddUpdateTaskState>(
      listener: (ctx, state){
        if(state is AddUpdateTaskLoaded) {
          ctx.router.maybePop(state.taskModel,);
        }
        else if(state is AddUpdateTaskError){
          showErrorSnackBar(context, state.message);
        }
      },
      builder: (context, state) {
        return FormBuilder(
          key: context.read<AddTaskBloc>().formKey,
          initialValue: context.read<AddTaskBloc>().initialForm,
          enabled: state is! AddUpdateTaskLoading,
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                context.l10n.addTask,
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  FormBuilderTextField(
                    name: AddTaskField.title.name,
                    validator: FormBuilderValidators.required(),
                    decoration: InputDecoration(
                      hintText: context.l10n.enterTaskTitle,
                    ),
                    minLines: 1,
                    maxLines: 3,
                  ),
                  vSeparator,
                  FormBuilderCheckbox (
                    title: Text(context.l10n.completed,),
                    initialValue: false,
                    name: AddTaskField.completed.name,
                  ),
                  const Spacer(),
                  IgnorePointer(
                    ignoring: state is AddUpdateTaskLoading,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        PrimaryButton(
                          loading: state is AddUpdateTaskLoading,
                          content: Text(
                            context.l10n.save,
                            style: context.textTheme.labelLarge,
                          ),
                          onPressed: () {
                            context
                                .read<AddTaskBloc>()
                                .add(AddUpdateTaskEvent(id: context
                                .read<AddTaskBloc>()
                                .task
                                ?.id,
                              ),
                            );
                          },
                        ),
                        PrimaryButton(
                          content: Text(
                            context.l10n.cancel,
                            style: context.textTheme.labelLarge,
                          ),
                          onPressed: context.router.maybePop,
                        ),
                      ],
                    ),
                  ),
                  20.verticalSpace,
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget get vSeparator => 10.verticalSpace;
}