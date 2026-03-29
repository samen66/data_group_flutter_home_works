import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw_36/core/di/injection_container.dart';
import 'package:hw_36/presentation/bloc/posts_bloc.dart';
import 'package:hw_36/presentation/bloc/posts_event.dart';
import 'package:hw_36/presentation/bloc/posts_state.dart';
import 'package:hw_36/presentation/widgets/animated_post_tile.dart';

/// View (MVVM): только отображение; состояние и команды — через BLoC как ViewModel.
class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<PostsBloc>()..add(const PostsRequested()),
      child: const _PostsView(),
    );
  }
}

class _PostsView extends StatelessWidget {
  const _PostsView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Посты — BLoC · Dio · Drift'),
      ),
      body: BlocBuilder<PostsBloc, PostsState>(
        builder: (context, state) {
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 320),
            switchInCurve: Curves.easeOut,
            switchOutCurve: Curves.easeIn,
            child: _bodyForState(context, state),
          );
        },
      ),
    );
  }

  Widget _bodyForState(BuildContext context, PostsState state) {
    return switch (state) {
      PostsInitial() || PostsLoadInProgress() => const Center(
          key: ValueKey('loading'),
          child: CircularProgressIndicator(),
        ),
      PostsLoadFailure(:final message) => Center(
          key: ValueKey('error'),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.cloud_off, size: 48, color: Theme.of(context).colorScheme.error),
                const SizedBox(height: 16),
                Text(message, textAlign: TextAlign.center),
                const SizedBox(height: 16),
                FilledButton(
                  onPressed: () =>
                      context.read<PostsBloc>().add(const PostsRequested()),
                  child: const Text('Повторить'),
                ),
              ],
            ),
          ),
        ),
      PostsLoadSuccess(:final posts, :final isRefreshing) => RefreshIndicator(
          key: ValueKey('list_${posts.length}'),
          onRefresh: () async {
            final bloc = context.read<PostsBloc>();
            bloc.add(const PostsRefreshRequested());
            await bloc.stream.firstWhere(
              (s) =>
                  (s is PostsLoadSuccess && !s.isRefreshing) ||
                  s is PostsLoadFailure,
            );
          },
          child: Stack(
            children: [
              ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(vertical: 12),
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  return AnimatedPostTile(
                    post: posts[index],
                    index: index,
                  );
                },
              ),
              if (isRefreshing)
                const LinearProgressIndicator(minHeight: 3),
            ],
          ),
        ),
    };
  }
}
