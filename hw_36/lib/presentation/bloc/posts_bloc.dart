import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw_36/domain/entities/post.dart';
import 'package:hw_36/domain/usecases/get_posts.dart';
import 'package:hw_36/presentation/bloc/posts_event.dart';
import 'package:hw_36/presentation/bloc/posts_state.dart';

/// BLoC в роли ViewModel (MVVM): UI подписывается на состояние, события — намерения.
class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc({required GetPosts getPosts})
      : _getPosts = getPosts,
        super(const PostsInitial()) {
    on<PostsRequested>(_onRequested);
    on<PostsRefreshRequested>(_onRefresh);
  }

  final GetPosts _getPosts;

  Future<void> _onRequested(
    PostsRequested event,
    Emitter<PostsState> emit,
  ) async {
    emit(const PostsLoadInProgress());
    try {
      final posts = await _getPosts(forceRemote: false);
      emit(PostsLoadSuccess(posts));
    } catch (e) {
      emit(PostsLoadFailure(e.toString()));
    }
  }

  Future<void> _onRefresh(
    PostsRefreshRequested event,
    Emitter<PostsState> emit,
  ) async {
    List<Post>? previousPosts;
    if (state is PostsLoadSuccess) {
      previousPosts = (state as PostsLoadSuccess).posts;
      emit(PostsLoadSuccess(previousPosts, isRefreshing: true));
    } else {
      emit(const PostsLoadInProgress());
    }
    try {
      final posts = await _getPosts(forceRemote: true);
      emit(PostsLoadSuccess(posts));
    } catch (e) {
      if (previousPosts != null) {
        emit(PostsLoadSuccess(previousPosts));
      } else {
        emit(PostsLoadFailure(e.toString()));
      }
    }
  }
}
