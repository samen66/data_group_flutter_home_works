import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/match.dart';

abstract class MatchesState extends Equatable {
  const MatchesState();

  @override
  List<Object?> get props => [];
}

class MatchesInitial extends MatchesState {
  const MatchesInitial();
}

class MatchesLoading extends MatchesState {
  final double? progress;

  const MatchesLoading({this.progress});

  @override
  List<Object?> get props => [progress];
}

class MatchesLoaded extends MatchesState {
  final List<Match> matches;

  const MatchesLoaded(this.matches);

  @override
  List<Object?> get props => [matches];
}

class MatchesError extends MatchesState {
  final Failure failure;

  const MatchesError(this.failure);

  @override
  List<Object?> get props => [failure];
}
