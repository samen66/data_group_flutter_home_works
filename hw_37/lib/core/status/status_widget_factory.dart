import 'package:flutter/material.dart';

import 'ui_request_status.dart';

/// Factory: builds the correct status presentation from [UiRequestStatus].
class StatusWidgetFactory {
  const StatusWidgetFactory._();

  static Widget build(
    UiRequestStatus status, {
    String? message,
    String? successSubtitle,
  }) {
    switch (status) {
      case UiRequestStatus.loading:
        return const Padding(
          padding: EdgeInsets.all(24),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 16),
                Text('Loading…'),
              ],
            ),
          ),
        );
      case UiRequestStatus.success:
        return Padding(
          padding: const EdgeInsets.all(24),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.check_circle, color: Colors.green.shade600, size: 48),
                const SizedBox(height: 12),
                Text(
                  successSubtitle ?? 'Done',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        );
      case UiRequestStatus.error:
        return Padding(
          padding: const EdgeInsets.all(24),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.error_outline, color: Colors.red.shade700, size: 48),
                const SizedBox(height: 12),
                Text(
                  message ?? 'Something went wrong',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
    }
  }
}
