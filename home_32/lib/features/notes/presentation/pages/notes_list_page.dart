import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import '../bloc/notes_bloc.dart';
import '../bloc/notes_event.dart';
import '../bloc/notes_state.dart';
import '../widgets/note_item_widget.dart';
import '../widgets/note_search_bar.dart';
import '../widgets/note_filters_widget.dart';
import '../widgets/empty_state_widget.dart';
import '../widgets/load_more_button.dart';
import '../../domain/entities/note_entity.dart';
import 'note_form_page.dart';

/// Страница списка заметок/задач
class NotesListPage extends StatefulWidget {
  final String collection;

  const NotesListPage({
    super.key,
    required this.collection,
  });

  @override
  State<NotesListPage> createState() => _NotesListPageState();
}

class _NotesListPageState extends State<NotesListPage> {
  final ScrollController _scrollController = ScrollController();
  NoteStatus? _filterStatus;
  String? _filterCategory;
  List<String> _categories = [];
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _initializeBloc(BuildContext context) {
    if (_isInitialized) return;
    _isInitialized = true;
    
    final userId = firebase_auth.FirebaseAuth.instance.currentUser?.uid;
    if (userId != null) {
      context.read<NotesBloc>().setUserId(userId);
      context.read<NotesBloc>().add(NotesEvent.loadNotes(widget.collection));
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.8) {
      final state = context.read<NotesBloc>().state;
      state.maybeWhen(
        loaded: (notes, hasMore, lastDocument) {
          if (hasMore) {
            context.read<NotesBloc>().add(NotesEvent.loadMore(widget.collection));
          }
        },
        orElse: () {},
      );
    }
  }

  void _handleSearch(String query) {
    if (query.isEmpty) {
      context.read<NotesBloc>().add(NotesEvent.clearFilters(widget.collection));
    } else {
      context.read<NotesBloc>().add(
            NotesEvent.searchNotes(
              collection: widget.collection,
              query: query,
            ),
          );
    }
  }

  void _handleStatusFilter(NoteStatus? status) {
    setState(() {
      _filterStatus = status;
    });
    context.read<NotesBloc>().add(
          NotesEvent.filterNotes(
            collection: widget.collection,
            status: status,
            category: _filterCategory,
          ),
        );
  }

  void _handleCategoryFilter(String? category) {
    setState(() {
      _filterCategory = category;
    });
    context.read<NotesBloc>().add(
          NotesEvent.filterNotes(
            collection: widget.collection,
            status: _filterStatus,
            category: category,
          ),
        );
  }

  void _handleClearFilters() {
    setState(() {
      _filterStatus = null;
      _filterCategory = null;
    });
    context.read<NotesBloc>().add(NotesEvent.clearFilters(widget.collection));
  }

  void _handleDelete(String noteId) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Удалить?'),
        content: const Text('Вы уверены, что хотите удалить эту запись?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text('Отмена'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              context.read<NotesBloc>().add(
                    NotesEvent.deleteNote(
                      noteId: noteId,
                      collection: widget.collection,
                    ),
                  );
            },
            child: const Text('Удалить', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesBloc, NotesState>(
      builder: (blocContext, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.collection == 'notes' ? 'Заметки' : 'Задачи'),
            actions: [
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  // Используем контекст из BlocBuilder
                  final notesBloc = BlocProvider.of<NotesBloc>(blocContext);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlocProvider.value(
                        value: notesBloc,
                        child: NoteFormPage(
                          collection: widget.collection,
                        ),
                      ),
                    ),
                  );
                },
                tooltip: 'Добавить',
              ),
            ],
          ),
          body: BlocConsumer<NotesBloc, NotesState>(
            listener: (context, state) {
              state.maybeWhen(
                error: (failure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(failure.message),
                      backgroundColor: Colors.red,
                    ),
                  );
                },
                orElse: () {},
              );
            },
            builder: (context, state) {
              // Инициализируем bloc при первом построении (initial состояние)
              state.when(
                initial: () {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    _initializeBloc(context);
                  });
                },
                loading: () {},
                loaded: (_, __, ___) {},
                empty: () {},
                error: (_) {},
              );

              return Column(
            children: [
              NoteSearchBar(
                onSearchChanged: _handleSearch,
                onClear: _handleClearFilters,
              ),
              NoteFiltersWidget(
                selectedStatus: _filterStatus,
                selectedCategory: _filterCategory,
                categories: _categories,
                onStatusChanged: _handleStatusFilter,
                onCategoryChanged: _handleCategoryFilter,
                onClearFilters: _handleClearFilters,
              ),
              Expanded(
                child: state.when(
                  initial: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  loaded: (notes, hasMore, lastDocument) {
                    if (notes.isEmpty) {
                      return const EmptyStateWidget(
                        message: 'Нет записей',
                        icon: Icons.note_outlined,
                      );
                    }
                    return RefreshIndicator(
                      onRefresh: () async {
                        context
                            .read<NotesBloc>()
                            .add(NotesEvent.loadNotes(widget.collection));
                      },
                      child: ListView.builder(
                        controller: _scrollController,
                        itemCount: notes.length + (hasMore ? 1 : 0),
                        itemBuilder: (context, index) {
                          if (index == notes.length) {
                            return LoadMoreButton(
                              onPressed: () {
                                context.read<NotesBloc>().add(
                                      NotesEvent.loadMore(widget.collection),
                                    );
                              },
                              isLoading: false,
                            );
                          }
                          final note = notes[index];
                          return NoteItemWidget(
                            note: note,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BlocProvider.value(
                                    value: context.read<NotesBloc>(),
                                    child: NoteFormPage(
                                      collection: widget.collection,
                                      note: note,
                                    ),
                                  ),
                                ),
                              );
                            },
                            onDelete: () => _handleDelete(note.id!),
                          );
                        },
                      ),
                    );
                  },
                  empty: () => const EmptyStateWidget(
                    message: 'Нет записей',
                    icon: Icons.note_outlined,
                  ),
                  error: (failure) => Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.error_outline, size: 64, color: Colors.red),
                        const SizedBox(height: 16),
                        Text(
                          failure.message,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            context
                                .read<NotesBloc>()
                                .add(NotesEvent.loadNotes(widget.collection));
                          },
                          child: const Text('Повторить'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ],
            );
            },
          ),
        );
      },
    );
  }
}
