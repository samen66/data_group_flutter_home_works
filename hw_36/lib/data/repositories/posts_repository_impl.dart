import 'package:hw_36/data/datasources/posts_local_datasource.dart';
import 'package:hw_36/data/datasources/posts_remote_datasource.dart';
import 'package:hw_36/domain/entities/post.dart';
import 'package:hw_36/domain/repositories/posts_repository.dart';

class PostsRepositoryImpl implements PostsRepository {
  PostsRepositoryImpl({
    required PostsRemoteDataSource remote,
    required PostsLocalDataSource local,
  })  : _remote = remote,
        _local = local;

  final PostsRemoteDataSource _remote;
  final PostsLocalDataSource _local;

  @override
  Future<List<Post>> getPosts({bool forceRemote = false}) async {
    if (!forceRemote) {
      final cached = await _local.readAll();
      if (cached.isNotEmpty) {
        return cached;
      }
    }

    try {
      final dtos = await _remote.fetchPosts();
      await _local.replaceAll(dtos);
      return dtos.map((e) => e.toEntity()).toList();
    } catch (_) {
      final cached = await _local.readAll();
      if (cached.isNotEmpty) {
        return cached;
      }
      rethrow;
    }
  }
}
