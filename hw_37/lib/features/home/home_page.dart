import 'package:flutter/material.dart';
import 'package:hw_37/core/analytics/analytics_service.dart';
import 'package:hw_37/core/api/parsed_api_result.dart';
import 'package:hw_37/core/logging/app_logger.dart';
import 'package:hw_37/core/status/status_widget_factory.dart';
import 'package:hw_37/core/status/ui_request_status.dart';
import 'package:hw_37/features/home/domain/user_profile_repository.dart';
import 'package:hw_37/features/home/presentation/profile/profile_window.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.profileRepository});

  final UserProfileRepository profileRepository;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UiRequestStatus _status = UiRequestStatus.loading;
  ParsedUser? _user;
  String? _fallbackSuccessLabel;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    AppLogger.instance.info('HomePage.initState');
    AnalyticsService.instance.track('screen_view', {'screen': 'home'});
    _load();
  }

  Future<void> _load() async {
    setState(() {
      _status = UiRequestStatus.loading;
      _user = null;
      _fallbackSuccessLabel = null;
      _errorMessage = null;
    });
    try {
      final result = await widget.profileRepository.loadUserProfile();
      if (!mounted) return;
      setState(() {
        _status = UiRequestStatus.success;
        if (result is ParsedUser) {
          _user = result;
          _fallbackSuccessLabel = null;
        } else {
          _user = null;
          _fallbackSuccessLabel = result.runtimeType.toString();
        }
      });
    } on Exception catch (e, st) {
      AppLogger.instance.debug('HomePage._load failed', e, st);
      AnalyticsService.instance.track('screen_error', {'screen': 'home', 'error': e.toString()});
      if (!mounted) return;
      setState(() {
        _status = UiRequestStatus.error;
        _user = null;
        _errorMessage = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: cs.surfaceContainerLowest,
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            tooltip: 'Reload (logs + analytics)',
            onPressed: () {
              AppLogger.instance.info('HomePage: manual refresh');
              AnalyticsService.instance.track('user_action', {'action': 'refresh'});
              _load();
            },
          ),
        ],
      ),
      body: switch (_status) {
        UiRequestStatus.loading => StatusWidgetFactory.build(_status),
        UiRequestStatus.error => StatusWidgetFactory.build(
            _status,
            message: _errorMessage,
          ),
        UiRequestStatus.success => _user != null
            ? ProfileWindow(user: _user!)
            : StatusWidgetFactory.build(
                _status,
                successSubtitle: _fallbackSuccessLabel,
              ),
      },
    );
  }
}
