import 'package:get_it/get_it.dart';
import 'package:hw_36/core/network/dio_client.dart';
import 'package:hw_36/data/database/app_database.dart';
import 'package:hw_36/data/datasources/posts_local_datasource.dart';
import 'package:hw_36/data/datasources/posts_remote_datasource.dart';
import 'package:hw_36/data/repositories/posts_repository_impl.dart';
import 'package:hw_36/domain/repositories/posts_repository.dart';
import 'package:hw_36/domain/usecases/get_posts.dart';
import 'package:hw_36/presentation/bloc/posts_bloc.dart';

final sl = GetIt.instance;

Future<void> configureDependencies() async {
  sl.registerLazySingleton<DioClient>(() => DioClient());

  sl.registerLazySingleton<AppDatabase>(() => AppDatabase());

  sl.registerLazySingleton<PostsRemoteDataSource>(
    () => PostsRemoteDataSourceImpl(sl<DioClient>().client),
  );

  sl.registerLazySingleton<PostsLocalDataSource>(
    () => PostsLocalDataSourceImpl(sl()),
  );

  sl.registerLazySingleton<PostsRepository>(
    () => PostsRepositoryImpl(
      remote: sl(),
      local: sl(),
    ),
  );

  sl.registerLazySingleton<GetPosts>(() => GetPosts(sl()));

  sl.registerFactory<PostsBloc>(() => PostsBloc(getPosts: sl()));
}
