part of 'tasks_bloc.dart';

class TasksEvent extends Equatable {
  const TasksEvent({this.page = 1});

  final int page;

  @override
  List<Object> get props => [];
}
