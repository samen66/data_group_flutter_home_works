import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/matches_bloc.dart';
import '../bloc/matches_event.dart';
import '../bloc/matches_state.dart';
import '../../../../core/widgets/error_widget.dart';
import '../widgets/match_card.dart';
import 'teams_page.dart';

class MatchesPage extends StatefulWidget {
  const MatchesPage({super.key});

  @override
  State<MatchesPage> createState() => _MatchesPageState();
}

class _MatchesPageState extends State<MatchesPage> {
  int _selectedFilter = 0; // 0: Все, 1: Ближайшие, 2: Прошедшие

  @override
  void initState() {
    super.initState();
    // Load matches on page load
    context.read<MatchesBloc>().add(const GetChampionsLeagueMatchesEvent());
  }

  void _onFilterChanged(int index) {
    setState(() {
      _selectedFilter = index;
    });

    final bloc = context.read<MatchesBloc>();
    switch (index) {
      case 0:
        bloc.add(const GetChampionsLeagueMatchesEvent());
        break;
      case 1:
        bloc.add(const GetUpcomingMatchesEvent());
        break;
      case 2:
        bloc.add(const GetFinishedMatchesEvent());
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Champions League'),
        actions: [
          IconButton(
            icon: const Icon(Icons.groups),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TeamsPage(),
                ),
              );
            },
            tooltip: 'Команды',
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              context.read<MatchesBloc>().add(const RefreshMatchesEvent());
            },
            tooltip: 'Обновить',
          ),
        ],
      ),
      body: Column(
        children: [
          // Filter chips
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  _buildFilterChip('Все', 0),
                  const SizedBox(width: 8),
                  _buildFilterChip('Ближайшие', 1),
                  const SizedBox(width: 8),
                  _buildFilterChip('Прошедшие', 2),
                ],
              ),
            ),
          ),
          const Divider(height: 1),
          // Matches list
          Expanded(
            child: BlocBuilder<MatchesBloc, MatchesState>(
              builder: (context, state) {
                if (state is MatchesInitial) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (state is MatchesLoading) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (state.progress != null) ...[
                          CircularProgressIndicator(
                            value: state.progress,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Загрузка: ${(state.progress! * 100).toStringAsFixed(0)}%',
                            style: const TextStyle(fontSize: 16),
                          ),
                        ] else
                          const CircularProgressIndicator(),
                      ],
                    ),
                  );
                }

                if (state is MatchesLoaded) {
                  if (state.matches.isEmpty) {
                    return const Center(
                      child: Text(
                        'Матчи не найдены',
                        style: TextStyle(fontSize: 16),
                      ),
                    );
                  }

                  return RefreshIndicator(
                    onRefresh: () async {
                      context.read<MatchesBloc>().add(const RefreshMatchesEvent());
                      await Future.delayed(const Duration(milliseconds: 500));
                    },
                    child: ListView.builder(
                      itemCount: state.matches.length,
                      itemBuilder: (context, index) {
                        return MatchCard(match: state.matches[index]);
                      },
                    ),
                  );
                }

                if (state is MatchesError) {
                  return ErrorDisplayWidget(
                    failure: state.failure,
                    onRetry: () {
                      context.read<MatchesBloc>().add(const RefreshMatchesEvent());
                    },
                  );
                }

                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, int index) {
    final isSelected = _selectedFilter == index;
    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (selected) {
        if (selected) {
          _onFilterChanged(index);
        }
      },
      selectedColor: Theme.of(context).colorScheme.primaryContainer,
      checkmarkColor: Theme.of(context).colorScheme.onPrimaryContainer,
    );
  }
}
