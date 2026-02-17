import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/error/failures.dart';
import '../entities/match.dart';
import '../entities/match_status.dart';

abstract class MatchesRepository {
  Future<Either<Failure, List<Match>>> getChampionsLeagueMatches({
    String? dateFrom,
    String? dateTo,
    MatchStatus? status,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  });

  Future<Either<Failure, Match>> getMatchById(
    int matchId, {
    CancelToken? cancelToken,
  });

  /// Получить прошедшие матчи
  Future<Either<Failure, List<Match>>> getFinishedMatches({
    String? dateFrom,
    String? dateTo,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  });

  /// Получить ближайшие матчи
  Future<Either<Failure, List<Match>>> getUpcomingMatches({
    String? dateFrom,
    String? dateTo,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  });
}
