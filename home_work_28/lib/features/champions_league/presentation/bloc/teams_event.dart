import 'package:equatable/equatable.dart';

abstract class TeamsEvent extends Equatable {
  const TeamsEvent();

  @override
  List<Object?> get props => [];
}

class GetChampionsLeagueTeamsEvent extends TeamsEvent {
  const GetChampionsLeagueTeamsEvent();
}

class GetTeamByIdEvent extends TeamsEvent {
  final int teamId;

  const GetTeamByIdEvent(this.teamId);

  @override
  List<Object?> get props => [teamId];
}

class GetTeamMatchesEvent extends TeamsEvent {
  final int teamId;
  final String? status;
  final String? dateFrom;
  final String? dateTo;

  const GetTeamMatchesEvent({
    required this.teamId,
    this.status,
    this.dateFrom,
    this.dateTo,
  });

  @override
  List<Object?> get props => [teamId, status, dateFrom, dateTo];
}

class RefreshTeamsEvent extends TeamsEvent {
  const RefreshTeamsEvent();
}
