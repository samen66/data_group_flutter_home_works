import 'package:equatable/equatable.dart';

class Team extends Equatable {
  final int id;
  final String name;
  final String shortName;
  final String? tla;
  final String? crest;
  final String? area;
  final String? address;
  final String? website;
  final int? founded;
  final String? clubColors;
  final String? venue;

  const Team({
    required this.id,
    required this.name,
    required this.shortName,
    this.tla,
    this.crest,
    this.area,
    this.address,
    this.website,
    this.founded,
    this.clubColors,
    this.venue,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        shortName,
        tla,
        crest,
        area,
        address,
        website,
        founded,
        clubColors,
        venue,
      ];
}
