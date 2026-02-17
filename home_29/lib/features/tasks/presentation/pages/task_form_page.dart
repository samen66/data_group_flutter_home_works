import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_29/features/tasks/domain/entities/task.dart';
import 'package:home_29/features/tasks/domain/entities/tag.dart';
import 'package:home_29/features/tasks/presentation/bloc/task_bloc.dart';
import 'package:home_29/features/tasks/presentation/bloc/task_event.dart';
import 'package:home_29/features/tasks/presentation/bloc/task_state.dart';

class TaskFormPage extends StatefulWidget {
  final Task? task;

  const TaskFormPage({super.key, this.task});

  @override
  State<TaskFormPage> createState() => _TaskFormPageState();
}

class _TaskFormPageState extends State<TaskFormPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late int _priority;
  late int? _selectedTagId;
  List<Tag> _tags = [];

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.task?.title ?? '');
    _descriptionController = TextEditingController(text: widget.task?.description ?? '');
    _priority = widget.task?.priority ?? 1;
    _selectedTagId = widget.task?.tagId;
    context.read<TaskBloc>().add(const LoadTags());
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.task == null ? 'New Task' : 'Edit Task'),
      ),
      body: BlocListener<TaskBloc, TaskState>(
        listener: (context, state) {
          if (state is TagsLoaded) {
            setState(() {
              _tags = state.tags;
            });
          }
          if (state is TaskCreated || state is TaskUpdated || state is ImportSuccess) {
            Navigator.pop(context);
          }
          if (state is TasksError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Error: ${state.failure.message}')),
            );
          }
        },
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
                maxLines: 4,
              ),
              const SizedBox(height: 16),
              const Text('Priority', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              RadioListTile<int>(
                title: const Text('Low'),
                value: 1,
                groupValue: _priority,
                onChanged: (value) {
                  setState(() {
                    _priority = value!;
                  });
                },
              ),
              RadioListTile<int>(
                title: const Text('Medium'),
                value: 2,
                groupValue: _priority,
                onChanged: (value) {
                  setState(() {
                    _priority = value!;
                  });
                },
              ),
              RadioListTile<int>(
                title: const Text('High'),
                value: 3,
                groupValue: _priority,
                onChanged: (value) {
                  setState(() {
                    _priority = value!;
                  });
                },
              ),
              const SizedBox(height: 16),
              const Text('Tag', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              BlocBuilder<TaskBloc, TaskState>(
                builder: (context, state) {
                  if (state is TagsLoaded) {
                    return DropdownButtonFormField<int?>(
                      value: _selectedTagId,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      items: [
                        const DropdownMenuItem<int?>(
                          value: null,
                          child: Text('No tag'),
                        ),
                        ..._tags.map((tag) {
                          return DropdownMenuItem<int?>(
                            value: tag.id,
                            child: Row(
                              children: [
                                Container(
                                  width: 16,
                                  height: 16,
                                  decoration: BoxDecoration(
                                    color: _parseColor(tag.color),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(tag.name),
                              ],
                            ),
                          );
                        }),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _selectedTagId = value;
                        });
                      },
                    );
                  }
                  return const SizedBox();
                },
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: _saveTask,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _parseColor(String hexColor) {
    try {
      return Color(int.parse(hexColor.replaceFirst('#', '0xFF')));
    } catch (e) {
      return Colors.grey;
    }
  }

  void _saveTask() {
    if (_formKey.currentState!.validate()) {
      final task = Task(
        id: widget.task?.id,
        title: _titleController.text,
        description: _descriptionController.text,
        createdAt: widget.task?.createdAt ?? DateTime.now(),
        updatedAt: DateTime.now(),
        priority: _priority,
        isCompleted: widget.task?.isCompleted ?? false,
        tagId: _selectedTagId,
      );

      if (widget.task == null) {
        context.read<TaskBloc>().add(CreateTask(task));
      } else {
        context.read<TaskBloc>().add(UpdateTask(task));
      }
    }
  }
}
