import 'package:dio/dio.dart';
import 'package:hw_36/data/models/post_dto.dart';

abstract class PostsRemoteDataSource {
  Future<List<PostDto>> fetchPosts();
}

class PostsRemoteDataSourceImpl implements PostsRemoteDataSource {
  PostsRemoteDataSourceImpl(this._dio);

  final Dio _dio;

  @override
  Future<List<PostDto>> fetchPosts() async {
    final response = await _dio.get<List<dynamic>>('/posts');
    final list = response.data;
    if (list == null) return [];
    return list
        .map((e) => PostDto.fromJson(Map<String, dynamic>.from(e as Map)))
        .toList();
  }
}
