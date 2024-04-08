import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:task_master/locator.dart';
import 'package:task_master_repo/src/tasks_repo/models/task_api_model.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';
const pageSize = 2;

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  TasksBloc() : super(RemoteTasksLoading()) {
    on<TasksEvent>((event, emit) async {
      try {
        final res = await Locator.repo.tasks.getAll(
          page: event.page, perPage: pageSize,);
        if(res.success) {
          emit(
            RemoteTasksLoaded(
              items: res.data!.data,
              page: event.page,
            ),
          );
        }else{
          emit(
            RemoteTasksError(
              message: res.message ?? '',
            ),
          );
        }
      } on Exception catch (e) {
        emit(RemoteTasksError(message: e.toString(),),);
      }
    });
  }

  void getTasks([int page = 0]) {
    add(TasksEvent(page: page,),);
  }
}
