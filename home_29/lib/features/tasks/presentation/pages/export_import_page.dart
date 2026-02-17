import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:home_29/features/tasks/presentation/bloc/task_bloc.dart';
import 'package:home_29/features/tasks/presentation/bloc/task_event.dart';
import 'package:home_29/features/tasks/presentation/bloc/task_state.dart';
import 'package:path_provider/path_provider.dart';

class ExportImportPage extends StatelessWidget {
  const ExportImportPage({super.key});

  Future<void> _exportData(BuildContext context) async {
    context.read<TaskBloc>().add(const ExportData());
  }

  Future<void> _importData(BuildContext context) async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['json'],
    );

    if (result != null && result.files.single.path != null) {
      final file = File(result.files.single.path!);
      final jsonString = await file.readAsString();
      context.read<TaskBloc>().add(ImportData(jsonString));
    }
  }

  Future<void> _saveExportedData(BuildContext context, String jsonData) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/tasks_export_${DateTime.now().millisecondsSinceEpoch}.json');
      await file.writeAsString(jsonData);
      
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Data exported to: ${file.path}'),
            duration: const Duration(seconds: 3),
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error saving file: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Export / Import'),
      ),
      body: BlocListener<TaskBloc, TaskState>(
        listener: (context, state) {
          if (state is ExportSuccess) {
            _saveExportedData(context, state.jsonData);
          }
          if (state is ImportSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Data imported successfully')),
            );
          }
          if (state is TasksError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Error: ${state.failure.message}')),
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Export Data',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      const Text('Export all tasks and tags to a JSON file.'),
                      const SizedBox(height: 16),
                      ElevatedButton.icon(
                        onPressed: () => _exportData(context),
                        icon: const Icon(Icons.upload),
                        label: const Text('Export to JSON'),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Import Data',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      const Text('Import tasks and tags from a JSON file.'),
                      const SizedBox(height: 16),
                      ElevatedButton.icon(
                        onPressed: () => _importData(context),
                        icon: const Icon(Icons.download),
                        label: const Text('Import from JSON'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
