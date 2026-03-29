import 'package:equatable/equatable.dart';
import 'package:hw_36/domain/entities/post.dart';

sealed class PostsState extends Equatable {
  const PostsState();

  @override
  List<Object?> get props => [];
}

final class PostsInitial extends PostsState {
  const PostsInitial();
}

final class PostsLoadInProgress extends PostsState {
  const PostsLoadInProgress();
}

final class PostsLoadSuccess extends PostsState {
  const PostsLoadSuccess(this.posts, {this.isRefreshing = false});

  final List<Post> posts;
  final bool isRefreshing;

  @override
  List<Object?> get props => [posts, isRefreshing];
}

final class PostsLoadFailure extends PostsState {
  const PostsLoadFailure(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
