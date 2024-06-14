import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:task_master/app/l10n/l10n.dart';
import 'package:task_master/app/router/app_router.gr.dart';
import 'package:task_master/core/extensions/context_extensions.dart';
import 'package:task_master/core/listing/listing_state.dart';
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
      create: (_) => TasksBloc(),
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
  final PagingController<int, TaskModel> pagingController = PagingController(
    firstPageKey: 0,
  );

  late StreamSubscription<TasksState> listingSubscription;

  @override
  void initState() {
    super.initState();
    final bloc = context.read<TasksBloc>();
    pagingController.addPageRequestListener(
      bloc.getTasks,
    );
    listingSubscription = bloc.stream
        .listen((state) {

      if (state is TasksLoaded) {
        if(state.items.isEmpty){
          pagingController.appendLastPage(state.items,);
        }else{
          pagingController.appendPage(state.items, state.page + 1);
        }
      }

      if (state is TasksError) {
        pagingController.error = state.message;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.welcomeBack,
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.logout_sharp,
          ),
          onPressed: () => context.read<AppStateCubit>().logOut(
                context,
              ),
        ),
      ),
      floatingActionButton: IconButton(
        onPressed: () {
          context.router.push(AddTaskPage()).then((value) {
            if(value is TaskModel){
              final index = pagingController.value
                  .itemList?.indexOf(value) ?? -1;
              if(index > -1){

                pagingController.value
                    .itemList?[index] = value;
              }
            }
          });
        },
        icon: Icon(
          color: context.theme.primaryColor,
          size: 75,
          Icons.add_circle,
        ),
      ),
      body: BlocListener<TasksBloc, TasksState>(
        listener: _listener,
        child:
           Padding(
            padding: const EdgeInsets.all(12),
            child: RefreshIndicator(
              onRefresh: () => Future.sync(
                pagingController.refresh,
              ),
              child:
              CustomScrollView(
                slivers: [
                  PagedSliverList<int, TaskModel>(
                    pagingController: pagingController,
                    builderDelegate: PagedChildBuilderDelegate<TaskModel>(
                      itemBuilder: (context, item, index) => TaskItem(
                        task: item,
                        onTaskUpdated: (task){
                          final index = pagingController.value
                              .itemList?.indexOf(task) ?? -1;
                          if(index > -1){

                            pagingController.value =
                            pagingController.value
                              ..itemList?[index] = task;
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

      ),
    );
  }

  void _listener(BuildContext ctx, TasksState state) {


  }

  @override
  void dispose() {
    listingSubscription.cancel();
    pagingController.dispose();
    super.dispose();
  }
}
