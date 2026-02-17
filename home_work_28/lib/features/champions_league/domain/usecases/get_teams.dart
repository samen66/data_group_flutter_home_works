import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/team.dart';
import '../entities/match.dart';
import '../repositories/teams_repository.dart';

class GetChampionsLeagueTeams implements UseCase<List<Team>, TeamsParams> {
  final TeamsRepository repository;

  GetChampionsLeagueTeams(this.repository);

  @override
  Future<Either<Failure, List<Team>>> call(TeamsParams params) async {
    return await repository.getChampionsLeagueTeams(
      cancelToken: params.cancelToken,
      onReceiveProgress: params.onReceiveProgress,
    );
  }
}

class TeamsParams {
  final CancelToken? cancelToken;
  final ProgressCallback? onReceiveProgress;

  TeamsParams({
    this.cancelToken,
    this.onReceiveProgress,
  });
}

class GetTeamById implements UseCase<Team, TeamIdParams> {
  final TeamsRepository repository;

  GetTeamById(this.repository);

  @override
  Future<Either<Failure, Team>> call(TeamIdParams params) async {
    return await repository.getTeamById(
      params.teamId,
      cancelToken: params.cancelToken,
    );
  }
}

class TeamIdParams {
  final int teamId;
  final CancelToken? cancelToken;

  TeamIdParams({
    required this.teamId,
    this.cancelToken,
  });
}

class GetTeamMatches implements UseCase<List<Match>, TeamMatchesParams> {
  final TeamsRepository repository;

  GetTeamMatches(this.repository);

  @override
  Future<Either<Failure, List<Match>>> call(TeamMatchesParams params) async {
    return await repository.getTeamMatches(
      params.teamId,
      status: params.status,
      dateFrom: params.dateFrom,
      dateTo: params.dateTo,
      cancelToken: params.cancelToken,
      onReceiveProgress: params.onReceiveProgress,
    );
  }
}

class TeamMatchesParams {
  final int teamId;
  final String? status;
  final String? dateFrom;
  final String? dateTo;
  final CancelToken? cancelToken;
  final ProgressCallback? onReceiveProgress;

  TeamMatchesParams({
    required this.teamId,
    this.status,
    this.dateFrom,
    this.dateTo,
    this.cancelToken,
    this.onReceiveProgress,
  });
}
