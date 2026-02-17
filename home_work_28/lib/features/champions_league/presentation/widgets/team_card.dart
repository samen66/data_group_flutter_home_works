import 'package:flutter/material.dart';
import '../../domain/entities/team.dart';

class TeamCard extends StatelessWidget {
  final Team team;

  const TeamCard({
    super.key,
    required this.team,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: InkWell(
        onTap: () {
          // Можно добавить навигацию к деталям команды
        },
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (team.crest != null)
                Image.network(
                  team.crest!,
                  height: 60,
                  width: 60,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.sports_soccer, size: 60);
                  },
                )
              else
                const Icon(Icons.sports_soccer, size: 60),
              const SizedBox(height: 8),
              Text(
                team.shortName,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              if (team.area != null) ...[
                const SizedBox(height: 4),
                Text(
                  team.area!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
