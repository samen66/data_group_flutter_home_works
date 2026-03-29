import 'package:hw_36/data/database/app_database.dart';
import 'package:hw_36/data/models/post_dto.dart';
import 'package:hw_36/domain/entities/post.dart';

abstract class PostsLocalDataSource {
  Future<List<Post>> readAll();
  Future<void> replaceAll(List<PostDto> dtos);
}

class PostsLocalDataSourceImpl implements PostsLocalDataSource {
  PostsLocalDataSourceImpl(this._db);

  final AppDatabase _db;

  @override
  Future<List<Post>> readAll() async {
    final rows = await _db.select(_db.localPosts).get();
    return rows
        .map(
          (r) => Post(
            id: r.id,
            userId: r.userId,
            title: r.title,
            body: r.body,
          ),
        )
        .toList();
  }

  @override
  Future<void> replaceAll(List<PostDto> dtos) async {
    await _db.transaction(() async {
      await _db.delete(_db.localPosts).go();
      await _db.batch((batch) {
        for (final dto in dtos) {
          batch.insert(_db.localPosts, dto.toCompanion());
        }
      });
    });
  }
}
