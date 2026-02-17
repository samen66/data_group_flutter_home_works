import '../../domain/entities/team.dart';

class TeamModel {
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

  const TeamModel({
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

  factory TeamModel.fromJson(Map<String, dynamic> json) {
    final area = json['area'] as Map<String, dynamic>?;

    return TeamModel(
      id: json['id'] as int,
      name: json['name'] as String? ?? 'Unknown',
      shortName: json['shortName'] as String? ?? json['name'] as String? ?? 'Unknown',
      tla: json['tla'] as String?,
      crest: json['crest'] as String?,
      area: area?['name'] as String?,
      address: json['address'] as String?,
      website: json['website'] as String?,
      founded: json['founded'] as int?,
      clubColors: json['clubColors'] as String?,
      venue: json['venue'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'shortName': shortName,
        'tla': tla,
        'crest': crest,
        'area': area != null ? {'name': area} : null,
        'address': address,
        'website': website,
        'founded': founded,
        'clubColors': clubColors,
        'venue': venue,
      };

  Team toDomain() => Team(
        id: id,
        name: name,
        shortName: shortName,
        tla: tla,
        crest: crest,
        area: area,
        address: address,
        website: website,
        founded: founded,
        clubColors: clubColors,
        venue: venue,
      );
}
