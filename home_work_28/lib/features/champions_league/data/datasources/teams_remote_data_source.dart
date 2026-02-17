import 'package:dio/dio.dart';
import '../models/team_model.dart';
import '../models/match_model.dart';

abstract class TeamsRemoteDataSource {
  Future<List<TeamModel>> getChampionsLeagueTeams({
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  });

  Future<TeamModel> getTeamById(
    int teamId, {
    CancelToken? cancelToken,
  });

  Future<List<MatchModel>> getTeamMatches(
    int teamId, {
    String? status,
    String? dateFrom,
    String? dateTo,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  });
}

class TeamsRemoteDataSourceImpl implements TeamsRemoteDataSource {
  final Dio dio;

  TeamsRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<TeamModel>> getChampionsLeagueTeams({
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      // Получаем команды Champions League через competition
      final response = await dio.get(
        '/competitions/CL/teams',
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );

      final teamsJson = response.data['teams'] as List<dynamic>;
      return teamsJson
          .map((json) => TeamModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<TeamModel> getTeamById(
    int teamId, {
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await dio.get(
        '/teams/$teamId',
        cancelToken: cancelToken,
      );

      return TeamModel.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<MatchModel>> getTeamMatches(
    int teamId, {
    String? status,
    String? dateFrom,
    String? dateTo,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final queryParams = <String, dynamic>{};

      if (status != null) {
        queryParams['status'] = status;
      }
      if (dateFrom != null) {
        queryParams['dateFrom'] = dateFrom;
      }
      if (dateTo != null) {
        queryParams['dateTo'] = dateTo;
      }

      final response = await dio.get(
        '/teams/$teamId/matches',
        queryParameters: queryParams.isNotEmpty ? queryParams : null,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );

      final matchesJson = response.data['matches'] as List<dynamic>;
      return matchesJson
          .map((json) => MatchModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
