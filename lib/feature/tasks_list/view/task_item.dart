part of 'tasks_page.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({
    required this.task,
    this.onTaskUpdated,
    super.key,

  });

  final TaskModel task;
  final void Function(TaskModel task)? onTaskUpdated;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15.r,),
      onTap: (){
        context.router.push(AddTaskPage(task: task,))
            .then((value) {
          if(value is TaskModel){
            onTaskUpdated?.call(value);
          }
        },
        );
      },
      child: Container(
        // height: 200.h,
        padding: EdgeInsets.all(8.r),
        margin: EdgeInsets.symmetric(
          vertical: 5.h,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            border: Border.all(
              color: Colors.black.withAlpha(
                50,
              ),
            ),),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    task.title,
                    style: context.textTheme.titleLarge,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CupertinoCheckbox(
                  value: task.completed,
                  checkColor: Colors.white,
                  onChanged: (s) {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
