import 'package:flutter/material.dart';
import 'package:hw_36/domain/entities/post.dart';

/// Явные анимации: [AnimationController] + slide + fade появления элемента списка.
class AnimatedPostTile extends StatefulWidget {
  const AnimatedPostTile({
    super.key,
    required this.post,
    required this.index,
  });

  final Post post;
  final int index;

  @override
  State<AnimatedPostTile> createState() => _AnimatedPostTileState();
}

class _AnimatedPostTileState extends State<AnimatedPostTile>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _slide;
  late final Animation<double> _fade;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 420),
    );
    final start = (widget.index * 0.05).clamp(0.0, 0.45);
    _slide = Tween<Offset>(
      begin: const Offset(0.08, 0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(start, 1, curve: Curves.easeOutCubic),
      ),
    );
    _fade = CurvedAnimation(
      parent: _controller,
      curve: Interval(start, 1, curve: Curves.easeOut),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SlideTransition(
      position: _slide,
      child: FadeTransition(
        opacity: _fade,
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          child: ListTile(
            leading: CircleAvatar(
              child: Text('${widget.post.id}'),
            ),
            title: Text(
              widget.post.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.titleSmall,
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 6),
              child: Text(
                widget.post.body,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodySmall,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
