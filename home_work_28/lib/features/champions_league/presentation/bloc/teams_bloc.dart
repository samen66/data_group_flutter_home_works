import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_teams.dart';
import '../../../../core/error/failures.dart';
import 'teams_event.dart';
import 'teams_state.dart';

class TeamsBloc extends Bloc<TeamsEvent, TeamsState> {
  final GetChampionsLeagueTeams getChampionsLeagueTeams;
  final GetTeamById getTeamById;
  final GetTeamMatches getTeamMatches;
  CancelToken? _cancelToken;

  TeamsBloc({
    required this.getChampionsLeagueTeams,
    required this.getTeamById,
    required this.getTeamMatches,
  }) : super(const TeamsInitial()) {
    on<GetChampionsLeagueTeamsEvent>(_onGetChampionsLeagueTeams);
    on<GetTeamByIdEvent>(_onGetTeamById);
    on<GetTeamMatchesEvent>(_onGetTeamMatches);
    on<RefreshTeamsEvent>(_onRefreshTeams);
  }

  Future<void> _onGetChampionsLeagueTeams(
    GetChampionsLeagueTeamsEvent event,
    Emitter<TeamsState> emit,
  ) async {
    _cancelToken?.cancel('New request started');
    _cancelToken = CancelToken();

    emit(const TeamsLoading());

    double? currentProgress;

    final result = await getChampionsLeagueTeams(
      TeamsParams(
        cancelToken: _cancelToken,
        onReceiveProgress: (received, total) {
          if (total != -1) {
            currentProgress = received / total;
            emit(TeamsLoading(progress: currentProgress));
          }
        },
      ),
    );

    result.fold(
      (failure) {
        if (failure is! CancellationFailure) {
          emit(TeamsError(failure));
        }
      },
      (teams) => emit(TeamsLoaded(teams)),
    );
  }

  Future<void> _onGetTeamById(
    GetTeamByIdEvent event,
    Emitter<TeamsState> emit,
  ) async {
    _cancelToken?.cancel('New request started');
    _cancelToken = CancelToken();

    emit(const TeamsLoading());

    final result = await getTeamById(
      TeamIdParams(
        teamId: event.teamId,
        cancelToken: _cancelToken,
      ),
    );

    result.fold(
      (failure) {
        if (failure is! CancellationFailure) {
          emit(TeamsError(failure));
        }
      },
      (team) => emit(TeamLoaded(team)),
    );
  }

  Future<void> _onGetTeamMatches(
    GetTeamMatchesEvent event,
    Emitter<TeamsState> emit,
  ) async {
    _cancelToken?.cancel('New request started');
    _cancelToken = CancelToken();

    emit(const TeamsLoading());

    double? currentProgress;

    final result = await getTeamMatches(
      TeamMatchesParams(
        teamId: event.teamId,
        status: event.status,
        dateFrom: event.dateFrom,
        dateTo: event.dateTo,
        cancelToken: _cancelToken,
        onReceiveProgress: (received, total) {
          if (total != -1) {
            currentProgress = received / total;
            emit(TeamsLoading(progress: currentProgress));
          }
        },
      ),
    );

    result.fold(
      (failure) {
        if (failure is! CancellationFailure) {
          emit(TeamsError(failure));
        }
      },
      (matches) => emit(TeamMatchesLoaded(matches)),
    );
  }

  Future<void> _onRefreshTeams(
    RefreshTeamsEvent event,
    Emitter<TeamsState> emit,
  ) async {
    add(const GetChampionsLeagueTeamsEvent());
  }

  @override
  Future<void> close() {
    _cancelToken?.cancel('Bloc disposed');
    return super.close();
  }
}
