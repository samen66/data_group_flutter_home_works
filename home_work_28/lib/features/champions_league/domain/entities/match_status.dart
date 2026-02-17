/// Статусы матчей согласно API football-data.org
enum MatchStatus {
  scheduled,
  live,
  inPlay,
  paused,
  finished,
  postponed,
  suspended,
  cancelled;

  String get apiValue {
    switch (this) {
      case MatchStatus.scheduled:
        return 'SCHEDULED';
      case MatchStatus.live:
        return 'LIVE';
      case MatchStatus.inPlay:
        return 'IN_PLAY';
      case MatchStatus.paused:
        return 'PAUSED';
      case MatchStatus.finished:
        return 'FINISHED';
      case MatchStatus.postponed:
        return 'POSTPONED';
      case MatchStatus.suspended:
        return 'SUSPENDED';
      case MatchStatus.cancelled:
        return 'CANCELLED';
    }
  }

  static MatchStatus? fromString(String? value) {
    if (value == null) return null;
    try {
      return MatchStatus.values.firstWhere(
        (status) => status.apiValue == value.toUpperCase(),
      );
    } catch (e) {
      return null;
    }
  }
}
