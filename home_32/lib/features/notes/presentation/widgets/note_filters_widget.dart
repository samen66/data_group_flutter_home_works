import 'package:flutter/material.dart';
import '../../domain/entities/note_entity.dart';

/// Виджет фильтров для заметок/задач
class NoteFiltersWidget extends StatelessWidget {
  final NoteStatus? selectedStatus;
  final String? selectedCategory;
  final List<String> categories;
  final ValueChanged<NoteStatus?> onStatusChanged;
  final ValueChanged<String?> onCategoryChanged;
  final VoidCallback onClearFilters;

  const NoteFiltersWidget({
    super.key,
    this.selectedStatus,
    this.selectedCategory,
    this.categories = const [],
    required this.onStatusChanged,
    required this.onCategoryChanged,
    required this.onClearFilters,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: DropdownButtonFormField<NoteStatus?>(
              value: selectedStatus,
              decoration: const InputDecoration(
                labelText: 'Статус',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              ),
              items: [
                const DropdownMenuItem<NoteStatus?>(
                  value: null,
                  child: Text('Все'),
                ),
                ...NoteStatus.values.map(
                  (status) => DropdownMenuItem<NoteStatus?>(
                    value: status,
                    child: Text(_getStatusText(status)),
                  ),
                ),
              ],
              onChanged: onStatusChanged,
            ),
          ),
          const SizedBox(width: 8),
          if (categories.isNotEmpty)
            Expanded(
              child: DropdownButtonFormField<String?>(
                value: selectedCategory,
                decoration: const InputDecoration(
                  labelText: 'Категория',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                ),
                items: [
                  const DropdownMenuItem<String?>(
                    value: null,
                    child: Text('Все'),
                  ),
                  ...categories.map(
                    (category) => DropdownMenuItem<String?>(
                      value: category,
                      child: Text(category),
                    ),
                  ),
                ],
                onChanged: onCategoryChanged,
              ),
            ),
          const SizedBox(width: 8),
          IconButton(
            icon: const Icon(Icons.clear_all),
            onPressed: onClearFilters,
            tooltip: 'Очистить фильтры',
          ),
        ],
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
