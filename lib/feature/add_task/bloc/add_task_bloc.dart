import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:task_master/core/extensions/auth_extensions.dart';
import 'package:task_master/feature/add_task/helpers/form_helpers.dart';
import 'package:task_master/locator.dart';
import 'package:task_master_repo/task_manager_repo.dart';

part 'add_task_event.dart';
part 'add_task_state.dart';

class AddTaskBloc extends Bloc<AddUpdateTaskEvent, AddUpdateTaskState> {
  AddTaskBloc({this.task}) : super(const AddUpdateTaskInitial()) {
    on<AddUpdateTaskEvent>((event, emit) async {
      if (!(formKey.currentState?.validate() ?? false)) {
        return;
      }
      emit(const AddUpdateTaskLoading());
      final userId = Locator.storage.getParsedUserData.id ?? -1;
      ApiResponseModel<TaskModel> apiResponseModel;
      final title = formKey.currentState?.instantValue[AddTaskField.title
          .name] as String;
      final completed = formKey.currentState?.instantValue[AddTaskField
          .completed.name] as bool;
      if (event.id != null) {
        apiResponseModel = await Locator.repo.tasks.addUpdate(
          id: event.id,
          userId: userId,
          completed: completed,
          title: title,
        );
      } else {
        apiResponseModel = await Locator.repo.tasks.addUpdate(
          userId: userId,
          completed: completed,
          title: title,
        );
      }
      if (apiResponseModel.success) {
        emit(AddUpdateTaskLoaded(taskModel: apiResponseModel.data!));
      } else {
        emit(AddUpdateTaskError(message: apiResponseModel.message ?? ''));
      }
    });
  }

  final formKey = GlobalKey<FormBuilderState>();

  /// provided when editing a task
  final TaskModel? task;

  Map<String ,dynamic> get initialForm {
    if(task != null) {
      return {
        AddTaskField.title.name: task!.title,
        AddTaskField.completed.name: task!.completed,
      };
    }
    return {};
  }

}
