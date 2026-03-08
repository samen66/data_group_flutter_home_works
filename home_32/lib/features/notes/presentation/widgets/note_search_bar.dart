import 'dart:async';
import 'package:flutter/material.dart';

/// Виджет поисковой строки
class NoteSearchBar extends StatefulWidget {
  final ValueChanged<String> onSearchChanged;
  final VoidCallback? onClear;

  const NoteSearchBar({
    super.key,
    required this.onSearchChanged,
    this.onClear,
  });

  @override
  State<NoteSearchBar> createState() => _NoteSearchBarState();
}

class _NoteSearchBarState extends State<NoteSearchBar> {
  final TextEditingController _controller = TextEditingController();
  Timer? _debounceTimer;

  @override
  void dispose() {
    _debounceTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _onSearchChanged(String value) {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      widget.onSearchChanged(value);
    });
  }

  void _onClear() {
    _controller.clear();
    widget.onClear?.call();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          hintText: 'Поиск по заголовку...',
          prefixIcon: const Icon(Icons.search),
          suffixIcon: _controller.text.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: _onClear,
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onChanged: _onSearchChanged,
      ),
    );
  }
}
