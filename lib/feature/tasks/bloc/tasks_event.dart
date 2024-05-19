part of 'tasks_bloc.dart';

abstract class BaseTasksListEvent extends Equatable {}
class TasksEvent extends BaseTasksListEvent {
  TasksEvent({this.page = 1});

  final int page;

  @override
  List<Object> get props => [];
}

class TaskAddedEvent extends BaseTasksListEvent {
  TaskAddedEvent({required this.task });

  final TaskModel task;

  @override
  List<Object> get props => [task];
}


