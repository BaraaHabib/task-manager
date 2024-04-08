part of 'tasks_bloc.dart';


abstract class TasksState extends Equatable {
  const TasksState();
}


class RemoteTasksLoaded extends TasksState with EquatableMixin {
  const RemoteTasksLoaded({this.items, this.page = 0,});

  final List<TaskModel>? items;
  final int? page;

  ///
  RemoteTasksLoaded appendItems({
    List<TaskModel>? data,
  }) {
    return RemoteTasksLoaded(
      items: data,
      page: page,
    );
  }

  @override
  List<Object> get props => [];
}

class RemoteTasksLoading extends TasksState with EquatableMixin{
  @override
  List<Object?> get props => [];

}

class RemoteTasksError extends TasksState with EquatableMixin {
  RemoteTasksError({required this.message});


  @override
  List<Object?> get props => [];

  final String message;

}
