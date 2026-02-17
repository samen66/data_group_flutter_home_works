import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_champions_league_matches.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/match_status.dart';
import 'matches_event.dart';
import 'matches_state.dart';

class MatchesBloc extends Bloc<MatchesEvent, MatchesState> {
  final GetChampionsLeagueMatches getChampionsLeagueMatches;
  final GetFinishedMatches getFinishedMatches;
  final GetUpcomingMatches getUpcomingMatches;
  CancelToken? _cancelToken;
  String? _lastDateFrom;
  String? _lastDateTo;
  MatchStatus? _lastStatus;

  MatchesBloc({
    required this.getChampionsLeagueMatches,
    required this.getFinishedMatches,
    required this.getUpcomingMatches,
  }) : super(const MatchesInitial()) {
    on<GetChampionsLeagueMatchesEvent>(_onGetChampionsLeagueMatches);
    on<GetFinishedMatchesEvent>(_onGetFinishedMatches);
    on<GetUpcomingMatchesEvent>(_onGetUpcomingMatches);
    on<RefreshMatchesEvent>(_onRefreshMatches);
  }

  Future<void> _onGetChampionsLeagueMatches(
    GetChampionsLeagueMatchesEvent event,
    Emitter<MatchesState> emit,
  ) async {
    // Cancel previous request if exists
    _cancelToken?.cancel('New request started');
    _cancelToken = CancelToken();

    _lastDateFrom = event.dateFrom;
    _lastDateTo = event.dateTo;
    _lastStatus = event.status;

    emit(const MatchesLoading());

    double? currentProgress;

    final result = await getChampionsLeagueMatches(
      MatchesParams(
        dateFrom: event.dateFrom,
        dateTo: event.dateTo,
        status: event.status,
        cancelToken: _cancelToken,
        onReceiveProgress: (received, total) {
          if (total != -1) {
            currentProgress = received / total;
            emit(MatchesLoading(progress: currentProgress));
          }
        },
      ),
    );

    result.fold(
      (failure) {
        // Don't emit error if request was cancelled
        if (failure is! CancellationFailure) {
          emit(MatchesError(failure));
        }
      },
      (matches) => emit(MatchesLoaded(matches)),
    );
  }

  Future<void> _onGetFinishedMatches(
    GetFinishedMatchesEvent event,
    Emitter<MatchesState> emit,
  ) async {
    _cancelToken?.cancel('New request started');
    _cancelToken = CancelToken();

    _lastDateFrom = event.dateFrom;
    _lastDateTo = event.dateTo;
    _lastStatus = MatchStatus.finished;

    emit(const MatchesLoading());

    double? currentProgress;

    final result = await getFinishedMatches(
      MatchesParams(
        dateFrom: event.dateFrom,
        dateTo: event.dateTo,
        cancelToken: _cancelToken,
        onReceiveProgress: (received, total) {
          if (total != -1) {
            currentProgress = received / total;
            emit(MatchesLoading(progress: currentProgress));
          }
        },
      ),
    );

    result.fold(
      (failure) {
        if (failure is! CancellationFailure) {
          emit(MatchesError(failure));
        }
      },
      (matches) => emit(MatchesLoaded(matches)),
    );
  }

  Future<void> _onGetUpcomingMatches(
    GetUpcomingMatchesEvent event,
    Emitter<MatchesState> emit,
  ) async {
    _cancelToken?.cancel('New request started');
    _cancelToken = CancelToken();

    _lastDateFrom = event.dateFrom;
    _lastDateTo = event.dateTo;
    _lastStatus = MatchStatus.scheduled;

    emit(const MatchesLoading());

    double? currentProgress;

    final result = await getUpcomingMatches(
      MatchesParams(
        dateFrom: event.dateFrom,
        dateTo: event.dateTo,
        cancelToken: _cancelToken,
        onReceiveProgress: (received, total) {
          if (total != -1) {
            currentProgress = received / total;
            emit(MatchesLoading(progress: currentProgress));
          }
        },
      ),
    );

    result.fold(
      (failure) {
        if (failure is! CancellationFailure) {
          emit(MatchesError(failure));
        }
      },
      (matches) => emit(MatchesLoaded(matches)),
    );
  }

  Future<void> _onRefreshMatches(
    RefreshMatchesEvent event,
    Emitter<MatchesState> emit,
  ) async {
    if (_lastStatus == MatchStatus.finished) {
      add(GetFinishedMatchesEvent(
        dateFrom: _lastDateFrom,
        dateTo: _lastDateTo,
      ));
    } else if (_lastStatus == MatchStatus.scheduled) {
      add(GetUpcomingMatchesEvent(
        dateFrom: _lastDateFrom,
        dateTo: _lastDateTo,
      ));
    } else if (_lastDateFrom != null || _lastDateTo != null || _lastStatus != null) {
      add(GetChampionsLeagueMatchesEvent(
        dateFrom: _lastDateFrom,
        dateTo: _lastDateTo,
        status: _lastStatus,
      ));
    } else {
      add(const GetChampionsLeagueMatchesEvent());
    }
  }

  @override
  Future<void> close() {
    _cancelToken?.cancel('Bloc disposed');
    return super.close();
  }
}
