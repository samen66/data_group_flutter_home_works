import 'package:hw_37/core/api/parsed_api_result.dart';
import 'package:hw_37/core/data/demo_api_client.dart';

import '../domain/user_profile_repository.dart';

/// Adapts [DemoApiClient] to [UserProfileRepository] (single integration point).
class DemoUserProfileRepository implements UserProfileRepository {
  const DemoUserProfileRepository(this._client);

  final DemoApiClient _client;

  @override
  Future<ParsedApiResult> loadUserProfile() => _client.loadUserProfile();
}
