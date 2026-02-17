import 'package:equatable/equatable.dart';
import '../../domain/entities/match_status.dart';

abstract class MatchesEvent extends Equatable {
  const MatchesEvent();

  @override
  List<Object?> get props => [];
}

class GetChampionsLeagueMatchesEvent extends MatchesEvent {
  final String? dateFrom;
  final String? dateTo;
  final MatchStatus? status;

  const GetChampionsLeagueMatchesEvent({
    this.dateFrom,
    this.dateTo,
    this.status,
  });

  @override
  List<Object?> get props => [dateFrom, dateTo, status];
}

class GetFinishedMatchesEvent extends MatchesEvent {
  final String? dateFrom;
  final String? dateTo;

  const GetFinishedMatchesEvent({
    this.dateFrom,
    this.dateTo,
  });

  @override
  List<Object?> get props => [dateFrom, dateTo];
}

class GetUpcomingMatchesEvent extends MatchesEvent {
  final String? dateFrom;
  final String? dateTo;

  const GetUpcomingMatchesEvent({
    this.dateFrom,
    this.dateTo,
  });

  @override
  List<Object?> get props => [dateFrom, dateTo];
}

class RefreshMatchesEvent extends MatchesEvent {
  const RefreshMatchesEvent();
}
