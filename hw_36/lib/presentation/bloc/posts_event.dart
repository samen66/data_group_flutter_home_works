import 'package:equatable/equatable.dart';

sealed class PostsEvent extends Equatable {
  const PostsEvent();

  @override
  List<Object?> get props => [];
}

/// Первая загрузка: сначала кэш (Drift), при пустом кэше — сеть (Dio).
final class PostsRequested extends PostsEvent {
  const PostsRequested();
}

/// Обновление с сервера и перезапись локальной БД.
final class PostsRefreshRequested extends PostsEvent {
  const PostsRefreshRequested();
}
