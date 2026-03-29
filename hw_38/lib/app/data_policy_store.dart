import 'package:shared_preferences/shared_preferences.dart';

import '../domain/repositories/notes_data_policy.dart';

/// Persists selected data policy (settings).
class DataPolicyStore {
  DataPolicyStore(this._prefs);

  static const _key = 'notes_data_policy';

  final SharedPreferences _prefs;

  NotesDataPolicy read() {
    final v = _prefs.getString(_key);
    return NotesDataPolicy.values.firstWhere(
      (e) => e.name == v,
      orElse: () => NotesDataPolicy.cacheFirst,
    );
  }

  Future<void> write(NotesDataPolicy policy) =>
      _prefs.setString(_key, policy.name);
}
