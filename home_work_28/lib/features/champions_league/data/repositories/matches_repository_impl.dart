import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_exceptions.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/match.dart';
import '../../domain/entities/match_status.dart';
import '../../domain/repositories/matches_repository.dart';
import '../datasources/matches_remote_data_source.dart';

class MatchesRepositoryImpl implements MatchesRepository {
  final MatchesRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  MatchesRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<Match>>> getChampionsLeagueMatches({
    String? dateFrom,
    String? dateTo,
    MatchStatus? status,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final matches = await remoteDataSource.getChampionsLeagueMatches(
          dateFrom: dateFrom,
          dateTo: dateTo,
          status: status,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress,
        );
        return Right(matches.map((model) => model.toDomain()).toList());
      } on DioException catch (e) {
        return Left(mapDioExceptionToFailure(e));
      } catch (e) {
        return Left(UnknownFailure(e.toString()));
      }
    } else {
      return const Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, List<Match>>> getFinishedMatches({
    String? dateFrom,
    String? dateTo,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    return getChampionsLeagueMatches(
      dateFrom: dateFrom,
      dateTo: dateTo,
      status: MatchStatus.finished,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );
  }

  @override
  Future<Either<Failure, List<Match>>> getUpcomingMatches({
    String? dateFrom,
    String? dateTo,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    return getChampionsLeagueMatches(
      dateFrom: dateFrom,
      dateTo: dateTo,
      status: MatchStatus.scheduled,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );
  }

  @override
  Future<Either<Failure, Match>> getMatchById(
    int matchId, {
    CancelToken? cancelToken,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final match = await remoteDataSource.getMatchById(
          matchId,
          cancelToken: cancelToken,
        );
        return Right(match.toDomain());
      } on DioException catch (e) {
        return Left(mapDioExceptionToFailure(e));
      } catch (e) {
        return Left(UnknownFailure(e.toString()));
      }
    } else {
      return const Left(NetworkFailure());
    }
  }
}
