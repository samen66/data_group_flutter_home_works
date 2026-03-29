/// Pure formatting for profile UI — no Flutter imports (easy to unit test).
final class ProfileDisplayFormatter {
  ProfileDisplayFormatter._();

  static String initialsFromDisplayName(String name) {
    final parts = name.trim().split(RegExp(r'\s+'));
    if (parts.isEmpty) return '?';
    if (parts.length == 1) {
      final s = parts[0];
      return s.isNotEmpty ? s[0].toUpperCase() : '?';
    }
    final a = parts[0].isNotEmpty ? parts[0][0] : '';
    final b = parts[1].isNotEmpty ? parts[1][0] : '';
    return ('$a$b').toUpperCase();
  }

  static String handleFromDisplayName(String displayName) {
    final slug = displayName.toLowerCase().replaceAll(RegExp(r'[^a-z0-9]+'), '');
    return slug.isEmpty ? 'user' : slug;
  }
}
