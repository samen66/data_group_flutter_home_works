import 'package:flutter_test/flutter_test.dart';
import 'package:hw_37/features/home/presentation/utils/profile_display_formatter.dart';

void main() {
  group('ProfileDisplayFormatter', () {
    test('initials from one word', () {
      expect(ProfileDisplayFormatter.initialsFromDisplayName('Ada'), 'A');
    });

    test('initials from two words', () {
      expect(ProfileDisplayFormatter.initialsFromDisplayName('Demo User'), 'DU');
    });

    test('handle slugifies display name', () {
      expect(ProfileDisplayFormatter.handleFromDisplayName('Demo User'), 'demouser');
    });
  });
}
