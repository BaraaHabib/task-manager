import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:task_master/core/extensions/auth_extensions.dart';
import 'package:task_master/locator.dart';
import 'package:task_master_repo/task_manager_repo.dart';
import 'package:task_master_storage/task_master_storage.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

const pageSize = 5;

class TasksBloc extends Bloc<BaseTasksListEvent, TasksState> {
  TasksBloc() : super(TasksLoading()) {
    on<TaskAddedEvent>((event, emit) async {
      emit(TaskAddedState(task: event.task,));
    });
    on<GetTasksEvent>((event, emit) async {
      try {

        emit(TasksLoading());

        ///

        /// get remote data
        final res = await Locator.repo.tasks.getAll(
          page: event.page,
          perPage: pageSize,
          id: Locator.storage.getParsedUserData.id ?? 0,
        );
        if (res.success) {
          await Locator.storage.setTasks(
            event.page,
            json.encode(res.data?.toJson()),
          );
          emit(
            TasksLoaded(
              items: res.data!.data,
              page: event.page,
            ),
          );
        } else {
          emit(
            TasksError(
              message: res.message ?? '',
            ),
          );
        }
      } on Exception catch (e) {
        emit(
          TasksError(
            message: e.toString(),
          ),
        );
      }
    });
  }

  void getTasks([int page = 0]) {
    add(
      GetTasksEvent(
        page: page,
      ),
    );
  }

  void appendTask(TaskModel value) {
    add(TaskAddedEvent(task: value));
  }

  // getTasksCallBa

}
