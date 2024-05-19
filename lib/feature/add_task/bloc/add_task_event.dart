part of 'add_task_bloc.dart';

class AddUpdateTaskEvent extends Equatable {
  const AddUpdateTaskEvent({
    this.id,
  });

  /// task id
  final int? id;

  @override
  List<Object> get props => [id ?? -1,];
}
