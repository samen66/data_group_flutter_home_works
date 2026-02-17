import 'package:flutter/material.dart';

class SortDialog extends StatefulWidget {
  final String currentSort;
  final bool ascending;

  const SortDialog({
    super.key,
    required this.currentSort,
    required this.ascending,
  });

  @override
  State<SortDialog> createState() => _SortDialogState();
}

class _SortDialogState extends State<SortDialog> {
  late String _selectedSort;
  late bool _ascending;

  @override
  void initState() {
    super.initState();
    _selectedSort = widget.currentSort;
    _ascending = widget.ascending;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Sort Tasks'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RadioListTile<String>(
            title: const Text('By Date'),
            value: 'date',
            groupValue: _selectedSort,
            onChanged: (value) {
              setState(() {
                _selectedSort = value!;
              });
            },
          ),
          RadioListTile<String>(
            title: const Text('By Priority'),
            value: 'priority',
            groupValue: _selectedSort,
            onChanged: (value) {
              setState(() {
                _selectedSort = value!;
              });
            },
          ),
          RadioListTile<String>(
            title: const Text('None'),
            value: 'none',
            groupValue: _selectedSort,
            onChanged: (value) {
              setState(() {
                _selectedSort = value!;
              });
            },
          ),
          const Divider(),
          SwitchListTile(
            title: const Text('Ascending'),
            value: _ascending,
            onChanged: (value) {
              setState(() {
                _ascending = value;
              });
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context, {
              'sortBy': _selectedSort,
              'ascending': _ascending,
            });
          },
          child: const Text('Apply'),
        ),
      ],
    );
  }
}
