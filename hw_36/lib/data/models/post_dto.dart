import 'package:drift/drift.dart';
import 'package:hw_36/data/database/app_database.dart';
import 'package:hw_36/domain/entities/post.dart';

class PostDto {
  const PostDto({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
  });

  final int id;
  final int userId;
  final String title;
  final String body;

  factory PostDto.fromJson(Map<String, dynamic> json) {
    return PostDto(
      id: json['id'] as int,
      userId: json['userId'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
    );
  }

  Post toEntity() => Post(
        id: id,
        userId: userId,
        title: title,
        body: body,
      );

  LocalPostsCompanion toCompanion() => LocalPostsCompanion.insert(
        id: Value(id),
        userId: userId,
        title: title,
        body: body,
      );
}
