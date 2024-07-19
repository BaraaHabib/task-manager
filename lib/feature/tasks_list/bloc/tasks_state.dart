part of 'tasks_bloc.dart';

abstract class TasksState extends Equatable {
  const TasksState();
}

class TasksLoaded extends TasksState with EquatableMixin {
  const TasksLoaded({
    this.items = const [],
    this.page = 0,
    this.local = false,
  });

  final List<TaskModel> items;
  final int page;
  final bool local;

  @override
  List<Object> get props => [page ?? 0,];
}

class TasksLoading extends TasksState with EquatableMixin {
  @override
  List<Object?> get props => [];
}

class TasksError extends TasksState with EquatableMixin {
  TasksError({required this.message});

  @override
  List<Object?> get props => [];

  final String message;
}

class TaskAddedState extends TasksState with EquatableMixin {
  TaskAddedState({required this.task });

  final TaskModel task;


  @override
  List<Object?> get props => [];

}
