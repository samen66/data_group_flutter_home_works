import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/error/failures.dart';
import '../entities/team.dart';
import '../entities/match.dart';

abstract class TeamsRepository {
  /// Получить все команды Champions League
  Future<Either<Failure, List<Team>>> getChampionsLeagueTeams({
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  });

  /// Получить команду по ID
  Future<Either<Failure, Team>> getTeamById(
    int teamId, {
    CancelToken? cancelToken,
  });

  /// Получить матчи команды
  Future<Either<Failure, List<Match>>> getTeamMatches(
    int teamId, {
    String? status,
    String? dateFrom,
    String? dateTo,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  });
}
