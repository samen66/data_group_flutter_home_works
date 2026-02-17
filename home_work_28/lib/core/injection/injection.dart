import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import '../network/dio_client.dart';
import '../network/network_info.dart';
import '../../features/champions_league/data/datasources/matches_remote_data_source.dart';
import '../../features/champions_league/data/datasources/teams_remote_data_source.dart';
import '../../features/champions_league/data/repositories/matches_repository_impl.dart';
import '../../features/champions_league/data/repositories/teams_repository_impl.dart';
import '../../features/champions_league/domain/repositories/matches_repository.dart';
import '../../features/champions_league/domain/repositories/teams_repository.dart';
import '../../features/champions_league/domain/usecases/get_champions_league_matches.dart';
import '../../features/champions_league/domain/usecases/get_teams.dart';
import '../../features/champions_league/presentation/bloc/matches_bloc.dart';
import '../../features/champions_league/presentation/bloc/teams_bloc.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  // Core
  getIt.registerLazySingleton<Connectivity>(() => Connectivity());
  getIt.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(getIt<Connectivity>()),
  );

  // Dio Client
  // TODO: Получите API токен на https://www.football-data.org/register
  // Для тестирования можно оставить null, но будут ограничения по запросам
  final dioClient = DioClient(
    apiToken: const String.fromEnvironment('FOOTBALL_API_TOKEN', defaultValue: ''),
  );
  getIt.registerLazySingleton<Dio>(() => dioClient.dio);

  // Features - Champions League
  // Data sources
  getIt.registerLazySingleton<MatchesRemoteDataSource>(
    () => MatchesRemoteDataSourceImpl(dio: getIt<Dio>()),
  );
  getIt.registerLazySingleton<TeamsRemoteDataSource>(
    () => TeamsRemoteDataSourceImpl(dio: getIt<Dio>()),
  );

  // Repositories
  getIt.registerLazySingleton<MatchesRepository>(
    () => MatchesRepositoryImpl(
      remoteDataSource: getIt<MatchesRemoteDataSource>(),
      networkInfo: getIt<NetworkInfo>(),
    ),
  );
  getIt.registerLazySingleton<TeamsRepository>(
    () => TeamsRepositoryImpl(
      remoteDataSource: getIt<TeamsRemoteDataSource>(),
      networkInfo: getIt<NetworkInfo>(),
    ),
  );

  // Use cases - Matches
  getIt.registerLazySingleton(
    () => GetChampionsLeagueMatches(getIt<MatchesRepository>()),
  );
  getIt.registerLazySingleton(
    () => GetFinishedMatches(getIt<MatchesRepository>()),
  );
  getIt.registerLazySingleton(
    () => GetUpcomingMatches(getIt<MatchesRepository>()),
  );

  // Use cases - Teams
  getIt.registerLazySingleton(
    () => GetChampionsLeagueTeams(getIt<TeamsRepository>()),
  );
  getIt.registerLazySingleton(
    () => GetTeamById(getIt<TeamsRepository>()),
  );
  getIt.registerLazySingleton(
    () => GetTeamMatches(getIt<TeamsRepository>()),
  );

  // Blocs
  getIt.registerFactory(
    () => MatchesBloc(
      getChampionsLeagueMatches: getIt<GetChampionsLeagueMatches>(),
      getFinishedMatches: getIt<GetFinishedMatches>(),
      getUpcomingMatches: getIt<GetUpcomingMatches>(),
    ),
  );
  getIt.registerFactory(
    () => TeamsBloc(
      getChampionsLeagueTeams: getIt<GetChampionsLeagueTeams>(),
      getTeamById: getIt<GetTeamById>(),
      getTeamMatches: getIt<GetTeamMatches>(),
    ),
  );
}
