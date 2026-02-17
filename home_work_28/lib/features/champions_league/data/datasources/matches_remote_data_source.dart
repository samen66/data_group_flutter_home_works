import 'package:dio/dio.dart';
import '../models/match_model.dart';
import '../../domain/entities/match_status.dart';

abstract class MatchesRemoteDataSource {
  Future<List<MatchModel>> getChampionsLeagueMatches({
    String? dateFrom,
    String? dateTo,
    MatchStatus? status,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  });

  Future<MatchModel> getMatchById(
    int matchId, {
    CancelToken? cancelToken,
  });
}

class MatchesRemoteDataSourceImpl implements MatchesRemoteDataSource {
  final Dio dio;

  MatchesRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<MatchModel>> getChampionsLeagueMatches({
    String? dateFrom,
    String? dateTo,
    MatchStatus? status,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      // Champions League competition ID is 2001 (или используем код CL)
      final queryParams = <String, dynamic>{
        'competitions': '2001',
      };

      if (dateFrom != null) {
        queryParams['dateFrom'] = dateFrom;
      }
      if (dateTo != null) {
        queryParams['dateTo'] = dateTo;
      }
      if (status != null) {
        queryParams['status'] = status.apiValue;
      }

      final response = await dio.get(
        '/matches',
        queryParameters: queryParams,
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

  @override
  Future<MatchModel> getMatchById(
    int matchId, {
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await dio.get(
        '/matches/$matchId',
        cancelToken: cancelToken,
      );

      return MatchModel.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }
  }
}
