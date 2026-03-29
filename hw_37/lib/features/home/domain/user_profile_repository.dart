import 'package:hw_37/core/api/parsed_api_result.dart';

/// Loads profile-related API payloads (Dependency Inversion: UI depends on this, not [DemoApiClient]).
abstract interface class UserProfileRepository {
  Future<ParsedApiResult> loadUserProfile();
}
