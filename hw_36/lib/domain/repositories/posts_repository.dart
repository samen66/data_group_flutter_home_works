import 'package:hw_36/domain/entities/post.dart';

/// Контракт репозитория: domain определяет интерфейс, data — реализацию.
abstract class PostsRepository {
  /// [forceRemote] — принудительно загрузить с сети и обновить кэш (Drift).
  Future<List<Post>> getPosts({bool forceRemote = false});
}
