import 'package:equatable/equatable.dart';

class Match extends Equatable {
  final int id;
  final String homeTeam;
  final String awayTeam;
  final int? homeScore;
  final int? awayScore;
  final String status;
  final DateTime utcDate;
  final String? competition;
  final String? stage;
  final String? matchday;

  const Match({
    required this.id,
    required this.homeTeam,
    required this.awayTeam,
    this.homeScore,
    this.awayScore,
    required this.status,
    required this.utcDate,
    this.competition,
    this.stage,
    this.matchday,
  });

  @override
  List<Object?> get props => [
        id,
        homeTeam,
        awayTeam,
        homeScore,
        awayScore,
        status,
        utcDate,
        competition,
        stage,
        matchday,
      ];
}
