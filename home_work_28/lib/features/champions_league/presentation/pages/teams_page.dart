import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/teams_bloc.dart';
import '../bloc/teams_event.dart';
import '../bloc/teams_state.dart';
import '../../../../core/widgets/error_widget.dart';
import '../widgets/team_card.dart';

class TeamsPage extends StatefulWidget {
  const TeamsPage({super.key});

  @override
  State<TeamsPage> createState() => _TeamsPageState();
}

class _TeamsPageState extends State<TeamsPage> {
  @override
  void initState() {
    super.initState();
    context.read<TeamsBloc>().add(const GetChampionsLeagueTeamsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Команды'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              context.read<TeamsBloc>().add(const RefreshTeamsEvent());
            },
            tooltip: 'Обновить',
          ),
        ],
      ),
      body: BlocBuilder<TeamsBloc, TeamsState>(
        builder: (context, state) {
          if (state is TeamsInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is TeamsLoading) {
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

          if (state is TeamsLoaded) {
            if (state.teams.isEmpty) {
              return const Center(
                child: Text(
                  'Команды не найдены',
                  style: TextStyle(fontSize: 16),
                ),
              );
            }

            return RefreshIndicator(
              onRefresh: () async {
                context.read<TeamsBloc>().add(const RefreshTeamsEvent());
                await Future.delayed(const Duration(milliseconds: 500));
              },
              child: GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.85,
                ),
                itemCount: state.teams.length,
                itemBuilder: (context, index) {
                  return TeamCard(team: state.teams[index]);
                },
              ),
            );
          }

          if (state is TeamsError) {
            return ErrorDisplayWidget(
              failure: state.failure,
              onRetry: () {
                context.read<TeamsBloc>().add(const RefreshTeamsEvent());
              },
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
