import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/match.dart';
import '../entities/match_status.dart';
import '../repositories/matches_repository.dart';

class GetChampionsLeagueMatches implements UseCase<List<Match>, MatchesParams> {
  final MatchesRepository repository;

  GetChampionsLeagueMatches(this.repository);

  @override
  Future<Either<Failure, List<Match>>> call(MatchesParams params) async {
    return await repository.getChampionsLeagueMatches(
      dateFrom: params.dateFrom,
      dateTo: params.dateTo,
      status: params.status,
      cancelToken: params.cancelToken,
      onReceiveProgress: params.onReceiveProgress,
    );
  }
}

class MatchesParams {
  final String? dateFrom;
  final String? dateTo;
  final MatchStatus? status;
  final CancelToken? cancelToken;
  final ProgressCallback? onReceiveProgress;

  MatchesParams({
    this.dateFrom,
    this.dateTo,
    this.status,
    this.cancelToken,
    this.onReceiveProgress,
  });
}

class GetFinishedMatches implements UseCase<List<Match>, MatchesParams> {
  final MatchesRepository repository;

  GetFinishedMatches(this.repository);

  @override
  Future<Either<Failure, List<Match>>> call(MatchesParams params) async {
    return await repository.getFinishedMatches(
      dateFrom: params.dateFrom,
      dateTo: params.dateTo,
      cancelToken: params.cancelToken,
      onReceiveProgress: params.onReceiveProgress,
    );
  }
}

class GetUpcomingMatches implements UseCase<List<Match>, MatchesParams> {
  final MatchesRepository repository;

  GetUpcomingMatches(this.repository);

  @override
  Future<Either<Failure, List<Match>>> call(MatchesParams params) async {
    return await repository.getUpcomingMatches(
      dateFrom: params.dateFrom,
      dateTo: params.dateTo,
      cancelToken: params.cancelToken,
      onReceiveProgress: params.onReceiveProgress,
    );
  }
}
