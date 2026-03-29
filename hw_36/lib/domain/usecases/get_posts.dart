import 'package:hw_36/domain/entities/post.dart';
import 'package:hw_36/domain/repositories/posts_repository.dart';

/// Use case: одна бизнес-операция для presentation-слоя (BLoC / «ViewModel»).
class GetPosts {
  GetPosts(this._repository);

  final PostsRepository _repository;

  Future<List<Post>> call({bool forceRemote = false}) {
    return _repository.getPosts(forceRemote: forceRemote);
  }
}
