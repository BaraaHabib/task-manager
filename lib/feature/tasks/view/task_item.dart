part of 'tasks_page.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({required this.task, super.key});

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 200.h,
      padding: EdgeInsets.all(8.r),
      margin: EdgeInsets.symmetric(
        vertical: 5.h,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
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
                checkColor: context.theme.primaryColor,
                onChanged: (s) {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
