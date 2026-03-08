import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import '../bloc/notes_bloc.dart';
import '../bloc/notes_event.dart';
import '../bloc/notes_state.dart';
import '../../domain/entities/note_entity.dart';

/// Страница формы создания/редактирования заметки/задачи
class NoteFormPage extends StatefulWidget {
  final String collection;
  final NoteEntity? note;

  const NoteFormPage({
    super.key,
    required this.collection,
    this.note,
  });

  @override
  State<NoteFormPage> createState() => _NoteFormPageState();
}

class _NoteFormPageState extends State<NoteFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _categoryController = TextEditingController();
  final _tagsController = TextEditingController();

  NoteType _selectedType = NoteType.note;
  NoteStatus? _selectedStatus;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    if (widget.note != null) {
      _titleController.text = widget.note!.title;
      _descriptionController.text = widget.note!.description;
      _categoryController.text = widget.note!.category ?? '';
      _tagsController.text = widget.note!.tags.join(', ');
      _selectedType = widget.note!.type;
      _selectedStatus = widget.note!.status;
    } else {
      _selectedType = widget.collection == 'tasks' ? NoteType.task : NoteType.note;
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _categoryController.dispose();
    _tagsController.dispose();
    super.dispose();
  }

  void _handleSave() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      final userId = firebase_auth.FirebaseAuth.instance.currentUser?.uid;
      if (userId == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Пользователь не авторизован')),
        );
        return;
      }

      final tags = _tagsController.text
          .split(',')
          .map((tag) => tag.trim())
          .where((tag) => tag.isNotEmpty)
          .toList();

      final note = NoteEntity(
        id: widget.note?.id,
        title: _titleController.text.trim(),
        description: _descriptionController.text.trim(),
        type: _selectedType,
        status: _selectedType == NoteType.task ? _selectedStatus : null,
        category: _categoryController.text.trim().isEmpty
            ? null
            : _categoryController.text.trim(),
        tags: tags,
        userId: userId,
        createdAt: widget.note?.createdAt ?? DateTime.now(),
        updatedAt: DateTime.now(),
      );

      if (widget.note == null) {
        context.read<NotesBloc>().add(
              NotesEvent.createNote(
                note: note,
                collection: widget.collection,
              ),
            );
      } else {
        context.read<NotesBloc>().add(
              NotesEvent.updateNote(
                note: note,
                collection: widget.collection,
              ),
            );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<NotesBloc, NotesState>(
      listener: (context, state) {
        state.when(
          initial: () {},
          loading: () {},
          loaded: (notes, hasMore, lastDocument) {
            // Закрываем экран только после успешного создания/обновления
            if (_isLoading) {
              Navigator.of(context).pop();
            }
          },
          empty: () {
            // Закрываем экран после успешного создания (если список пустой)
            if (_isLoading) {
              Navigator.of(context).pop();
            }
          },
          error: (failure) {
            setState(() {
              _isLoading = false;
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(failure.message),
                backgroundColor: Colors.red,
              ),
            );
          },
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.note == null ? 'Создать' : 'Редактировать'),
          actions: [
            if (_isLoading)
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              )
            else
              IconButton(
                icon: const Icon(Icons.check),
                onPressed: _handleSave,
                tooltip: 'Сохранить',
              ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                DropdownButtonFormField<NoteType>(
                  value: _selectedType,
                  decoration: const InputDecoration(
                    labelText: 'Тип',
                    border: OutlineInputBorder(),
                  ),
                  items: [
                    const DropdownMenuItem(
                      value: NoteType.note,
                      child: Text('Заметка'),
                    ),
                    const DropdownMenuItem(
                      value: NoteType.task,
                      child: Text('Задача'),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _selectedType = value!;
                      if (_selectedType == NoteType.note) {
                        _selectedStatus = null;
                      } else if (_selectedStatus == null) {
                        _selectedStatus = NoteStatus.pending;
                      }
                    });
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                    labelText: 'Заголовок',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Введите заголовок';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(
                    labelText: 'Описание',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 5,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Введите описание';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                if (_selectedType == NoteType.task) ...[
                  DropdownButtonFormField<NoteStatus?>(
                    value: _selectedStatus,
                    decoration: const InputDecoration(
                      labelText: 'Статус',
                      border: OutlineInputBorder(),
                    ),
                    items: [
                      const DropdownMenuItem(
                        value: null,
                        child: Text('Не выбран'),
                      ),
                      ...NoteStatus.values.map(
                        (status) => DropdownMenuItem(
                          value: status,
                          child: Text(_getStatusText(status)),
                        ),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _selectedStatus = value;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                ],
                TextFormField(
                  controller: _categoryController,
                  decoration: const InputDecoration(
                    labelText: 'Категория',
                    border: OutlineInputBorder(),
                    hintText: 'Опционально',
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _tagsController,
                  decoration: const InputDecoration(
                    labelText: 'Теги',
                    border: OutlineInputBorder(),
                    hintText: 'Разделяйте запятыми',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _getStatusText(NoteStatus status) {
    switch (status) {
      case NoteStatus.pending:
        return 'Ожидает';
      case NoteStatus.inProgress:
        return 'В работе';
      case NoteStatus.completed:
        return 'Завершено';
      case NoteStatus.cancelled:
        return 'Отменено';
    }
  }
}
