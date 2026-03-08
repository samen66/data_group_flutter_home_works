import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';
import 'core/di/injection_container.dart' as di;
import 'core/services/fcm_service.dart';
import 'core/utils/notification_logger.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/auth/presentation/widgets/auth_wrapper.dart';
import 'features/notes/presentation/pages/note_form_page.dart';
import 'features/notes/presentation/pages/notes_list_page.dart';
import 'features/notes/presentation/bloc/notes_bloc.dart';
import 'features/notes/domain/repositories/notes_repository.dart';
import 'features/notes/domain/entities/note_entity.dart';

/// Глобальный ключ для навигации (для deep links из background)
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

/// Background message handler (должен быть top-level функцией)
@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  NotificationLogger.logNotificationReceived(
    payload: message.data,
    timestamp: DateTime.now(),
  );
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Инициализация Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  // Настройка background message handler
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  
  // Инициализация Dependency Injection
  await di.init();
  
  // Инициализация FCM service
  final fcmService = di.getIt<FCMService>();
  await fcmService.initialize(
    onNotificationTap: _handleNotificationTap,
  );
  
  runApp(const MyApp());
}

/// Обработка нажатия на уведомление (deep link)
void _handleNotificationTap(Map<String, dynamic> data) async {
  final itemId = data['itemId'] as String?;
  final type = data['type'] as String?;
  
  if (itemId == null || type == null) return;
  
  // Навигация к конкретному item
  final context = navigatorKey.currentContext;
  if (context == null) return;
  
  final collection = type == 'note' ? 'notes' : 'tasks';
  
  // Загружаем заметку из Firestore
  try {
    final notesRepository = di.getIt<NotesRepository>();
    final result = await notesRepository.getNoteById(
      noteId: itemId,
      collection: collection,
    );
    
    result.fold(
      (failure) {
        // Если не удалось загрузить, просто открываем список
        _navigateToNotesList(context, collection);
      },
      (note) {
        // Открываем форму редактирования с загруженной заметкой
        _navigateToNoteForm(context, collection, note);
      },
    );
  } catch (e) {
    // В случае ошибки открываем список
    _navigateToNotesList(context, collection);
  }
}

/// Навигация к списку заметок
void _navigateToNotesList(BuildContext context, String collection) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => BlocProvider(
        create: (context) => di.getIt<NotesBloc>(),
        child: NotesListPage(collection: collection),
      ),
    ),
  );
}

/// Навигация к форме редактирования заметки
void _navigateToNoteForm(BuildContext context, String collection, NoteEntity note) {
  // Получаем или создаем NotesBloc
  NotesBloc? notesBloc;
  try {
    notesBloc = context.read<NotesBloc>();
  } catch (e) {
    // Если bloc не найден, создаем новый
    notesBloc = di.getIt<NotesBloc>();
  }
  
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => BlocProvider.value(
        value: notesBloc!,
        child: NoteFormPage(
          collection: collection,
          note: note,
        ),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.getIt<AuthBloc>(),
      child: MaterialApp(
        navigatorKey: navigatorKey,
        title: 'Home 32',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const AuthWrapper(),
      ),
    );
  }
}
