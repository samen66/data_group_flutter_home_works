import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_29/features/tasks/presentation/bloc/task_bloc.dart';
import 'package:home_29/features/tasks/presentation/bloc/task_event.dart';
import 'package:home_29/features/tasks/presentation/bloc/task_state.dart';
import 'package:home_29/features/tasks/presentation/widgets/task_list_item.dart';
import 'package:home_29/features/tasks/presentation/widgets/sort_dialog.dart';
import 'package:home_29/features/tasks/presentation/pages/task_form_page.dart';
import 'package:home_29/features/tasks/presentation/pages/tags_page.dart';
import 'package:home_29/features/tasks/presentation/pages/export_import_page.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({super.key});

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  String _sortBy = 'date';
  bool _ascending = true;
  bool _useWatch = true;

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  void _loadTasks() {
    if (_useWatch) {
      switch (_sortBy) {
        case 'date':
          context.read<TaskBloc>().add(WatchTasksSortedByDate(ascending: _ascending));
          break;
        case 'priority':
          context.read<TaskBloc>().add(WatchTasksSortedByPriority(ascending: _ascending));
          break;
        default:
          context.read<TaskBloc>().add(const WatchTasks());
      }
    } else {
      switch (_sortBy) {
        case 'date':
          context.read<TaskBloc>().add(LoadTasksSortedByDate(ascending: _ascending));
          break;
        case 'priority':
          context.read<TaskBloc>().add(LoadTasksSortedByPriority(ascending: _ascending));
          break;
        default:
          context.read<TaskBloc>().add(const LoadTasks());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks'),
        actions: [
          IconButton(
            icon: Icon(_useWatch ? Icons.visibility : Icons.visibility_off),
            tooltip: _useWatch ? 'Using watch() - Auto updates' : 'Using get() - Manual refresh',
            onPressed: () {
              setState(() {
                _useWatch = !_useWatch;
              });
              _loadTasks();
            },
          ),
          IconButton(
            icon: const Icon(Icons.sort),
            onPressed: () async {
              final result = await showDialog<Map<String, dynamic>>(
                context: context,
                builder: (context) => SortDialog(
                  currentSort: _sortBy,
                  ascending: _ascending,
                ),
              );
              if (result != null) {
                setState(() {
                  _sortBy = result['sortBy'] as String;
                  _ascending = result['ascending'] as bool;
                });
                _loadTasks();
              }
            },
          ),
          IconButton(
            icon: const Icon(Icons.label),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const TagsPage()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.import_export),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ExportImportPage()),
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          if (state is TaskLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is TasksError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Error: ${state.failure.message}'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _loadTasks,
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          if (state is TasksLoaded) {
            if (state.tasks.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.task_alt, size: 64, color: Colors.grey),
                    const SizedBox(height: 16),
                    Text(
                      'No tasks yet',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      state.isWatching
                          ? 'Using watch() - changes will appear automatically'
                          : 'Using get() - pull to refresh',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.grey,
                          ),
                    ),
                  ],
                ),
              );
            }

            return Column(
              children: [
                if (state.isWatching)
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(8),
                    color: Colors.green.withOpacity(0.1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.visibility, size: 16, color: Colors.green),
                        const SizedBox(width: 8),
                        Text(
                          'Live updates enabled (watch())',
                          style: TextStyle(color: Colors.green, fontSize: 12),
                        ),
                      ],
                    ),
                  )
                else
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(8),
                    color: Colors.orange.withOpacity(0.1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.visibility_off, size: 16, color: Colors.orange),
                        const SizedBox(width: 8),
                        Text(
                          'Manual refresh (get()) - pull down to refresh',
                          style: TextStyle(color: Colors.orange, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      if (!_useWatch) {
                        _loadTasks();
                      }
                    },
                    child: ListView.builder(
                      itemCount: state.tasks.length,
                      itemBuilder: (context, index) {
                        final task = state.tasks[index];
                        return TaskListItem(
                          task: task,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TaskFormPage(task: task),
                              ),
                            );
                          },
                          onToggleComplete: (isCompleted) {
                            context.read<TaskBloc>().add(
                                  UpdateTask(
                                    task.copyWith(isCompleted: isCompleted),
                                  ),
                                );
                          },
                          onDelete: () {
                            if (task.id != null) {
                              context.read<TaskBloc>().add(DeleteTask(task.id!));
                            }
                          },
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          }

          return const Center(child: Text('No data'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TaskFormPage()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
