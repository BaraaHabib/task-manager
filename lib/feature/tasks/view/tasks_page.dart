import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:task_master/app/l10n/l10n.dart';
import 'package:task_master/core/extensions/context_extensions.dart';
import 'package:task_master/core/extensions/string_extensions.dart';
import 'package:task_master/feature/app_state/app_state.dart';
import 'package:task_master/feature/tasks/tasks.dart';
import 'package:task_master_repo/task_manager_repo.dart';
import 'package:task_master_ui/task_master_ui.dart';
part './task_item.dart';

@RoutePage()
class TasksPage extends StatelessWidget {
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TasksBloc()..getTasks(),
      child: const TasksView(),
    );
  }
}

class TasksView extends StatefulWidget {
  const TasksView({super.key});

  @override
  State<TasksView> createState() => _TasksViewState();
}

class _TasksViewState extends State<TasksView> {
  final PagingController<int, TaskModel> pagingController =
  PagingController(firstPageKey: 0,invisibleItemsThreshold: 2,);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.welcomeBack,),
        leading: IconButton(
          icon: const Icon(Icons.logout_sharp),
          onPressed: () => context.read<AppStateCubit>().logOut(context),

        ),
      ),
      body: BlocConsumer<TasksBloc, TasksState>(
        listener: _listener,
        builder: (context, state) {
          if(state is TasksLoading){
            return const LoadingWidget();
          }
          return Padding(
            padding: const EdgeInsets.all(12),
            child: PagedListView<int, TaskModel>(
              pagingController: pagingController,
              builderDelegate: PagedChildBuilderDelegate<TaskModel>(
                itemBuilder: (context, item, index) => TaskItem(task: item,),
                animateTransitions: true,
              ),
            ),
          );
        },
      ),
    );
  }

  void _listener(BuildContext ctx, TasksState state) {
    if (state is TasksLoaded) {
      final currentPage = state.page ?? 0;
      final items = state.items ?? [];
      final isLastPage = state.items!.length < pageSize;
      if (isLastPage) {
        pagingController.appendLastPage(state.items!);
      } else {
        final nextPageKey = currentPage + state.items!.length;
        pagingController.appendPage(items, nextPageKey);
      }

      if(state.local) {
        showSuccessSnackBar(context, 'Offline mode');
      }
    }
  }
}
