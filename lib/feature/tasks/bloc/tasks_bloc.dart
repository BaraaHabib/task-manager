import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:task_master/locator.dart';
import 'package:task_master_repo/task_manager_repo.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';
const pageSize = 2;

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  TasksBloc() : super(TasksLoading()) {
    on<TasksEvent>((event, emit) async {
      try {
        final res = await Locator.repo.tasks.getAll(
          page: event.page, perPage: pageSize,);
        if(res.success) {
          await Locator.storage.setTasks(json.encode(res.data?.toJson()),);
          emit(
            TasksLoaded(
              items: res.data!.data,
              page: event.page,
            ),
          );
        }else {
          final localItems = Locator.storage.getTasks;

          if (localItems != null) {
            emit(
              TasksLoaded(
                items: TasksApiModel
                    .fromJson(localItems)
                    .data,
                page: event.page,
                local: true,
              ),
            );
          } else {
            emit(
              TasksLoaded(
                items: res.data!.data,
                page: event.page,
              ),
            );
          }
        }
      } on Exception catch (e) {
        emit(TasksError(message: e.toString(),),);
      }
    });
  }

  void getTasks([int page = 0]) {
    add(TasksEvent(page: page,),);
  }
}
