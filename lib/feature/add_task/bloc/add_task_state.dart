part of 'add_task_bloc.dart';

abstract class AddUpdateTaskState extends Equatable {
  const AddUpdateTaskState();

}

class AddUpdateTaskInitial extends AddUpdateTaskState{
  const AddUpdateTaskInitial();

  @override
  List<Object?> get props => [];
}
class AddUpdateTaskLoading extends AddUpdateTaskState{

  const AddUpdateTaskLoading();


  @override
  List<Object> get props => [];
}

class AddUpdateTaskLoaded extends AddUpdateTaskState{
  const AddUpdateTaskLoaded({required this.taskModel});


  final TaskModel taskModel;

  @override
  List<Object> get props => [taskModel,];
}

class AddUpdateTaskError extends AddUpdateTaskState{
  const AddUpdateTaskError({required this.message});


  final String message;

  @override
  List<Object> get props => [message,];
}
