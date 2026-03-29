import 'dart:io' show Platform;

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:path_provider_foundation/path_provider_foundation.dart';
import 'package:path_provider_linux/path_provider_linux.dart';
import 'package:path_provider_windows/path_provider_windows.dart';

/// Dart-реализации path_provider (FFI), иначе остаётся MethodChannel без нативного хендлера.
void registerPathProviderImplementations() {
  if (kIsWeb) return;
  if (Platform.isAndroid) return;

  if (Platform.isIOS || Platform.isMacOS) {
    PathProviderFoundation.registerWith();
  } else if (Platform.isWindows) {
    PathProviderWindows.registerWith();
  } else if (Platform.isLinux) {
    PathProviderLinux.registerWith();
  }
}
