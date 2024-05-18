part of 'tasks_bloc.dart';

abstract class TasksState extends Equatable {
  const TasksState();
}

class TasksLoaded extends TasksState with EquatableMixin {
  const TasksLoaded({
    this.items,
    this.page = 0,
    this.local = false,
  });

  final List<TaskModel>? items;
  final int? page;
  final bool local;

  ///
  TasksLoaded appendItems({
    List<TaskModel>? data,
  }) {
    return TasksLoaded(
      items: data,
      page: page,
    );
  }

  @override
  List<Object> get props => [];
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
