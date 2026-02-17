import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_exceptions.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/match.dart';
import '../../domain/entities/team.dart';
import '../../domain/repositories/teams_repository.dart';
import '../datasources/teams_remote_data_source.dart';

class TeamsRepositoryImpl implements TeamsRepository {
  final TeamsRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  TeamsRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<Team>>> getChampionsLeagueTeams({
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final teams = await remoteDataSource.getChampionsLeagueTeams(
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress,
        );
        return Right(teams.map((model) => model.toDomain()).toList());
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
  Future<Either<Failure, Team>> getTeamById(
    int teamId, {
    CancelToken? cancelToken,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final team = await remoteDataSource.getTeamById(
          teamId,
          cancelToken: cancelToken,
        );
        return Right(team.toDomain());
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
  Future<Either<Failure, List<Match>>> getTeamMatches(
    int teamId, {
    String? status,
    String? dateFrom,
    String? dateTo,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final matches = await remoteDataSource.getTeamMatches(
          teamId,
          status: status,
          dateFrom: dateFrom,
          dateTo: dateTo,
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
}
