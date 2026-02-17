import '../../domain/entities/match.dart';

class MatchModel {
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

  const MatchModel({
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

  factory MatchModel.fromJson(Map<String, dynamic> json) {
    final homeTeam = json['homeTeam'] as Map<String, dynamic>?;
    final awayTeam = json['awayTeam'] as Map<String, dynamic>?;
    final score = json['score'] as Map<String, dynamic>?;
    final fullTime = score?['fullTime'] as Map<String, dynamic>?;
    final competition = json['competition'] as Map<String, dynamic>?;

    return MatchModel(
      id: json['id'] as int,
      homeTeam: homeTeam?['name'] as String? ?? 'Unknown',
      awayTeam: awayTeam?['name'] as String? ?? 'Unknown',
      homeScore: fullTime?['home'] as int?,
      awayScore: fullTime?['away'] as int?,
      status: json['status'] as String? ?? 'SCHEDULED',
      utcDate: DateTime.parse(json['utcDate'] as String),
      competition: competition?['name'] as String?,
      stage: json['stage'] as String?,
      matchday: json['matchday']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'homeTeam': {'name': homeTeam},
        'awayTeam': {'name': awayTeam},
        'score': {
          'fullTime': {
            'home': homeScore,
            'away': awayScore,
          },
        },
        'status': status,
        'utcDate': utcDate.toIso8601String(),
        'competition': competition != null ? {'name': competition} : null,
        'stage': stage,
        'matchday': matchday,
      };

  Match toDomain() => Match(
        id: id,
        homeTeam: homeTeam,
        awayTeam: awayTeam,
        homeScore: homeScore,
        awayScore: awayScore,
        status: status,
        utcDate: utcDate,
        competition: competition,
        stage: stage,
        matchday: matchday,
      );
}
