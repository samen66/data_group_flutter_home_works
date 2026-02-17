import 'package:equatable/equatable.dart';
import '../../domain/entities/team.dart';
import '../../domain/entities/match.dart';
import '../../../../core/error/failures.dart';

abstract class TeamsState extends Equatable {
  const TeamsState();

  @override
  List<Object?> get props => [];
}

class TeamsInitial extends TeamsState {
  const TeamsInitial();
}

class TeamsLoading extends TeamsState {
  final double? progress;

  const TeamsLoading({this.progress});

  @override
  List<Object?> get props => [progress];
}

class TeamsLoaded extends TeamsState {
  final List<Team> teams;

  const TeamsLoaded(this.teams);

  @override
  List<Object?> get props => [teams];
}

class TeamLoaded extends TeamsState {
  final Team team;

  const TeamLoaded(this.team);

  @override
  List<Object?> get props => [team];
}

class TeamMatchesLoaded extends TeamsState {
  final List<Match> matches;

  const TeamMatchesLoaded(this.matches);

  @override
  List<Object?> get props => [matches];
}

class TeamsError extends TeamsState {
  final Failure failure;

  const TeamsError(this.failure);

  @override
  List<Object?> get props => [failure];
}
